C     ------------------------------------------------------------------
C
C     Subroutine:  autodt.for
C
C     ------------------------------------------------------------------
C
C     Author(s):   Steven Humphreys
C                  Sandia National Laboratories
C
C                  Terry Heames
C                  ALION
C
C     Description: This subroutine determines the next time step based
C                  on user specified events and manual time step
C                  control.
C
C     Usage:       call autodt(numsteps, minstep, simtim, dt_new)
C
C     Inputs:      numsteps, minstep, simtim, dt_new
C
C     Outputs:     simtim, dt_new, on_event, on_step
C
C                  Note: no other routine anywhere should change the
C                  global variables on_event or on_step. They are meant
C                  to be changed by autodt alone.
C
C     Variables:   i, event_dt, step_dt
C
C     Calls:       None.
C
C
C     Version:     3.10
C
C     Date:        March 7, 1996
C
C     Revision
C     History:	 Added the minimum decay time to limit time step
C
C                  March, 2005  adjusted for times when the time step needs
C                  to be reduced because the flow is chnaging too much.
C
C                  2.2 - June 1998 - removed the extra spray model 
c                  times from forcing an output
C
C                  1.1 - March 7, 1996 - made the on_event (previosly
C                  onzone) and on_step (previosly onstep) variables
C                  global. They are declared in the simulate.h include
C                  file.
C
C                  1.0 - February 1, 1996 - initial version.
C
C
C     ------------------------------------------------------------------

      subroutine autodt(numsteps, minstep, simtim, dt_new)
c
      include 'full.com'
c
      integer numsteps, numb
      double precision minstep(*), simtim, dt_new, time_next

      integer i
      double precision event_dt, step_dt, DT_LIMIT

C        Set the minimum allowed time step.

      double precision DT_MIN
      parameter(DT_MIN = 0.0001)

C
C      set maxmimum change in time step and maximum first step
C                             (4 hr = 14400 s)        (2 s)
ctjh
      IF ( calculate_daughters .ne. 0 ) THEN
        DT_LIMIT = min(1800.0 , 4.0*dt_new)
C
C        minimum decay time limit on interval
C
        if (SIMTIM.lt.10000.0) then
	     DT_LIMIT = min(DT_LIMIT, 0.25*dt_decay)
	     IF(DT_LIMIT.gt.180.0) DT_LIMIT = 180.d0

        else if (SIMTIM.lt. 40000) then
	     DT_LIMIT = min(DT_LIMIT, 0.5*dt_decay)
	     IF(DT_LIMIT.gt.180.0) DT_LIMIT = 180.d0
        else
	     DT_LIMIT = min(DT_LIMIT, dt_decay)
        end if
      ELSE
c          no daughtering
        DT_LIMIT = min(14400.0 , 4.0*dt_new)
      END IF

	
      if (SIMTIM.lt.45000.0 .and. DT_LIMIT.gt.360.0) DT_LIMIT = 360.d0
	  
C        Try to round simtim to the nearest 0.05 hour (180 seconds)
C        note that simtim is the old beginning time & dt_new is the old time step
C        so the best you can do is affect things in 2 intervals
C
      IF (SIMTIM+dt_new+DT_LIMIT .GT. 540.0) THEN
         III = (SIMTIM+dt_new+DT_LIMIT) / 180.0d0
         diff = (SIMTIM+dt_new+DT_LIMIT) - III*180.0d0
         if (diff .lt. 0.15*DT_LIMIT) DT_LIMIT = DT_LIMIT - diff
         diff = (III+1)*180.0d0 - (SIMTIM+dt_new+DT_LIMIT) 
         if (diff .lt. 0.15*DT_LIMIT) DT_LIMIT = DT_LIMIT + diff
      END IF
c
      
      if (SIMTIM .eq. 0.0)                           DT_LIMIT = 0.1d0
      if (SIMTIM .eq. 0.0 .and. Version .lt. 3.10)   DT_LIMIT = 2.0d0

      IF (DABS(SIMTIM-RESET_DT1) .lt. 1.0)           DT_LIMIT = 2.0d0
      IF (DABS(SIMTIM-RESET_DT2) .lt. 1.0)           DT_LIMIT = 2.0d0
      IF (DABS(SIMTIM-RESET_DT3) .lt. 1.0)           DT_LIMIT = 2.0d0
      IF (DABS(SIMTIM-RESET_DT4) .lt. 1.0)           DT_LIMIT = 2.0d0


      IF (LEVEL_NECSTEPS .GE. 1) THEN
         IF (SIMTIM .EQ. 0.0) write(out_unit, '(1x, a,5f11.2)') 
     &    ' AUTODT = ',DT_LIMIT,RESET_DT1,RESET_DT2,RESET_DT3,RESET_DT4
      END IF
C
C        Update the current simulation time(S) and set on_event
C         and on_step to .true.
         on_event = .true.
         on_step = .true.
         simtim = simtim + dt_new

C        If we're not finished simulating then determine the next time
C        step.

         if(minstep(numsteps) .gt. simtim) then

C           Find the next user event defined time step.

            do i = 1, numsteps, 1
               if(minstep(i) .gt. simtim) then
                  event_dt = minstep(i) - simtim
C                 Make sure that the time step is at least as big
C                 as the smallest possible time step.
                  if(event_dt .lt. DT_MIN) then
                     cycle
                  else
                     exit
                  end if
               end if
            end do
C
C           Find the next manually defined time step.

C           First set step_dt to the end of the last time. This is
C           equivalent to not having any manual time steps.

            step_dt = minstep(numsteps)

            if(dt_max_count .ge. 1) then
               do i = dt_max_count, 1, -1
                  if(dt_max_time(i) .le. simtim) then
                     if(dt_max(i) .gt. 0.0) then
                        step_dt = dt_max(i) - dmod(simtim, dt_max(i))
C                       Make sure that the time step is at least as big
C                       as the smallest possible time step.
                        if(step_dt .lt. DT_MIN) then
                           step_dt = dt_max(i)
                        end if
                     end if
                     exit
                  end if
               end do
            end if

C           Now select the smaller of the two time steps.

            dt_new = dmin1(event_dt, step_dt, DT_LIMIT)

C           Set on_event to true if we are at a user defined time zone.
C           Otherwise set it to false.

            on_event = (dabs(dt_new - event_dt) .lt. DT_MIN)
C
C    set on_event for first time step
C
            IF (simtim.EQ.0.0 .and. VERSION.ge.3.10) on_event = .TRUE.
C
C ... eliminate the spray times from this consideration
c
            if (on_event .and. sprays_time_marker(2).gt.0.0
     &                   .and. simtim.gt.0.0) then

                time_next = simtim + event_dt
                do numb = 2,49
                  if (dabs(time_next - sprays_time_marker(numb))
     &                   .lt. DT_MIN) on_event = .false.
                end do
            end if
c
C           Set on_step to true if we are at a user defined time step.
C           Otherwise set it to false.

            on_step = (dabs(dt_new - step_dt) .lt. DT_MIN) 

C        If we're done simulating set the time step to 0.0 and make sure
C        that our simulation time doesn't exceed the maximum specified
C        time.
C 
Ctjh
            IF ( LEVEL_NECSTEPS .GE. 1 ) THEN
              if (simtim.lt.7200.) write(out_unit,'(1x,a,f11.4,4f11.2)') 
     &              ' AUTODT = ',SIMTIM/3600., dt_new, event_dt, 
     &                step_dt, DT_LIMIT
            END IF
C
         else
            dt_new = 0.0
            simtim = minstep(numsteps)
         end if

         return

      end

C     ------------------------------------------------------------------
