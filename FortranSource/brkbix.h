C     ------------------------------------------------------------------
C
C     Include:     brkbix.h
C
C     ------------------------------------------------------------------
C
C     Author(s):   David K. Monroe
C                  Sandia National Laboratories
C
C     Description:
C
C     Usage:
C
C     Variables:
C
C     Assumptions: 
C
C     Version:     1.1
C
C     Date:        December 10, 1996
C
C     Revision
C     History:     1.1 - December 10, 1996 - Added brock_angle variable
C                  for the total angle of all of the bends in the pipe.
C
C                  1.0 - July 9, 1996 - Initial version.
C
C
C     ------------------------------------------------------------------

C        Declaration of variables for Brockman/Bixler subroutines.

         double precision
     &      brock_time(MAXPATH, MAXCOUNT),
     &      brock_flow(MAXPATH, MAXCOUNT),
     &      brock_temp(MAXPATH, MAXCOUNT),
     &      brock_volume(MAXPATH, MAXCOUNT),
     &      brock_surface(MAXPATH, MAXCOUNT),
     &      brock_pressure(MAXPATH, MAXCOUNT),
     &      brock_angle(MAXPATH, MAXCOUNT),
     &      brock_output(MAXPATH,9),
     &      brock_velocity(MAXPATH)
         integer
     &      part_index,
     &      brock_count(MAXPATH)

C        Common block for Brockman/Bixler subroutines.

         common /brkbix/

     &      brock_time,
     &      brock_flow,
     &      brock_temp,
     &      brock_volume,
     &      brock_surface,
     &      brock_pressure,
     &      brock_angle,
     &      brock_output,
     &      brock_velocity,

     &      part_index,
     &      brock_count

C     ------------------------------------------------------------------
