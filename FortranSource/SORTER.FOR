C       VERSION CREATED ON 07 JUNE 1995 DURING TESTING

C       ################################################################
        SUBROUTINE SORTER ( NVAL, VALS )
C       ################################################################

C       This subroutine does a brute-force sort on the NVAL elements
C       of the double precision array VALS. It returns the sorted elements in the
C       same array. These elements are treated as time-values, but any
C       set of double precision numbers can be sorted in the same way.

C       Note that this subroutine DOES NOT delete repeated elements!
C       Thus, the value of NVAL will not change. The deletion of
C       repeated elements is done in RADTRAD subroutine NECSTEPS and
C       in driver program DRVSRT.

C       ############################################################    
C       ##### THIS SUBROUTINE WILL FAIL IF ANY OF THE ELEMENTS #####
C       ##### OF THE ARRAY 'VALS' IS GREATER THAN THE INITIAL  #####
C       ##### VALUE OF THE VARIABLE 'VMINSET' SPECIFIED BELOW! #####
C       ############################################################    

C       Inputs:
C       NVAL, the number of values passed
C       VALS, the array whose elements are the values passed
C
C       Outputs:
C       NVAL, the number of values after sorting
C       VALS, the array whose elements are the sorted values
C
C       ----------------------------------------------------------------
C       CREATED BY DKM, SUMMER OF 1994
C       ----------------------------------------------------------------
        
C       include file        
        INCLUDE 'full.com'

        INTEGER IV, ITMP
        INTEGER JV, JMIN
        INTEGER KV
        INTEGER NVAL

        double precision VMINSET, VMIN
c  kew
c  changed these to be dimensioned to zone size
c  ...
        double precision VALS(MAXZONE), VTMP(MAXZONE)
        double precision HRTOSC, VSAV

c  kew
c  abort if we had too many points
c  ...
        if ( nval .gt. MAXZONE ) then
          WRITE(out_unit,'(1X,i6,A51)') 
     &      nval,' Exceeds maximum number of user time points allowed'
          write(out_unit,*) 
     &          '***********    S T O P  (SORTER) *****************'

C      *****************    S T O P   ***************************
        STOP
        end if

C       conversion factor, hours to seconds
        HRTOSC = 3600.0

C       set value of variable VMIN <<====================== [VMINSET IS HERE!]
        VMINSET = 1.0E+33    

C       write banner on entry into subroutine
        IF ( LEVEL_SORTER .GE. 1 ) THEN
          WRITE(out_unit,'(1X,A18)') 'SUBROUTINE SORTER!'
        END IF

C       check for non-physical (negative) time value
        DO IV = 1, NVAL
          IF ( VALS(IV) .LT. 0.0 ) THEN
C           problem has occurred with a time value passed             
            WRITE(out_unit,'(1X,A47)') 
     &       'NON-PHYSICAL (NEGATIVE) TIME VALUE ENCOUNTERED!'
            WRITE(out_unit,'(1X,A5,I3,A4,E13.4,A1)') 
     &       'VALS(', IV, ') = ', VALS(IV), '!'
            WRITE(out_unit,'(10(5(i4,1pe12.4),/))')
     &        (II,Vals(II)/3600.0, II=1,NVAL)
            write(out_unit,*) 
     &          '***********    S T O P  (SORTER) *****************'

C      *****************    S T O P   ***************************
        STOP
          END IF
        END DO

C       write time values passed, seconds
        IF ( LEVEL_SORTER .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A32)') 'UNSORTED TIME VALUES IN SECONDS:'
          DO IV = 1, NVAL
            WRITE(out_unit,'(1X,A5,I4,A5,E11.4,A4)') 
     *       'VALS(', IV, ')  = ', VALS(IV), ' sec'
          END DO
        END IF

C       convert time values to hours
        DO IV = 1, NVAL
          VSAV = VALS(IV)
          VALS(IV) = VSAV / HRTOSC
        END DO

C       write time values passed, hours
        IF ( LEVEL_SORTER .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A30)') 'UNSORTED TIME VALUES IN HOURS:'            
          DO IV = 1, NVAL
            WRITE(out_unit,'(1X,A5,I4,A5,F11.4,A3)') 
     *       'VALS(', IV, ')  = ', VALS(IV), ' hr'
          END DO
        END IF

C       do-loop over each temporary value
        DO ITMP = 1, NVAL

C         initialize mininmum value 
          VMIN = VMINSET

C         do-loop over each given value
          DO JV = 1, NVAL

C           if given value is non-negative then
            IF ( VALS(JV) .GE. 0.0 ) THEN

C             if given value less than mininum then
              IF ( VALS(JV) .LT. VMIN ) THEN

C               save value as new mininum
                VMIN = VALS(JV)

C               save index for value
                JMIN = JV
              
              END IF
C             end if given value less than mininum

            END IF
C           end if given value is non-negative            

          END DO
C         end do-loop over each given value

C         load given value into temporary array
          VTMP(ITMP) = VALS(JMIN)

C         reset given value to non-physical value
          VALS(JMIN) = - 1.0

        END DO
C       end do-loop over each temporary value

C       load temp-array into vals-array
        DO KV = 1, NVAL
          VALS(KV) = VTMP(KV)
        END DO

C       write time values in hours
        IF ( LEVEL_SORTER .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A28)') 'SORTED TIME VALUES IN HOURS:'  
          DO IV = 1, NVAL
            WRITE(out_unit,'(1X,A5,I4,A5,F11.4,A3)') 
     *       'VALS(', IV, ')  = ', VALS(IV), ' hr'
          END DO
        END IF

C       convert time values to seconds        
        DO IV = 1, NVAL
          VSAV = VALS(IV)
          VALS(IV) = VSAV * HRTOSC
        END DO

C       write time values in seconds
        IF ( LEVEL_SORTER .GE. 2 ) THEN
          WRITE(out_unit,'(1X,A30)') 'SORTED TIME VALUES IN SECONDS:'     
          DO IV = 1, NVAL
            WRITE(out_unit,'(1X,A5,I4,A5,E11.4,A4)') 
     *       'VALS(', IV, ')  = ', VALS(IV), ' sec'
          END DO
        END IF

C       return to caller
        RETURN

C       end of subroutine sorter
        END

