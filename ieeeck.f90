!---------------------------------------------------------------------------!
!  ieeeck.f90.  Version date: 25.07.2024.                                   !
!  Purpose:                                                                 !
!  IEEECK verifies that Infinity and possibly NaN arithmetic is safe.       !
!  Arguments:                                                               !
!  ISPEC  (input) INTEGER. Specifies whether to test just for inifinity     !
!         arithmetic or whether to test for infinity and NaN arithmetic.    !
!         = 0: Verify infinity arithmetic only.                             !
!         = 1: Verify infinity and NaN arithmetic.                          !
!  ZERO   (input) REAL*16.  Must contain the value 0.0Q0                    !
!  ONE    (input) REAL*16.  Must contain the value 1.0Q0                    !
!  RETURN VALUE:  INTEGER                                                   !
!          = 0:  Arithmetic failed to produce the correct answers           !
!          = 1:  Arithmetic produced the correct answers                    !
!---------------------------------------------------------------------------!
    program work
    print *, IEEECK( 0, 0.0Q0, 1.0Q0)
    print *, IEEECK( 1, 0.0Q0, 1.0Q0)
    end program work
    
      INTEGER FUNCTION  IEEECK( ISPEC, ZERO, ONE )
      INTEGER  ISPEC
      REAL*16     ONE, ZERO,NAN1, NAN2, NAN3, NAN4, NAN5, NAN6
      REAL*16     NEGINF, NEGZRO, NEWZRO, POSINF
      IEEECK = 1
      POSINF = ONE / ZERO
	PRINT *, POSINF
      IF( POSINF .LE. ONE ) THEN
        IEEECK = 0
        RETURN
      END IF
      NEGINF = -ONE / ZERO
	PRINT *, NEGINF
      IF( NEGINF .GE. ZERO ) THEN
        IEEECK = 0
        RETURN
      END IF

      NEGZRO = ONE / ( NEGINF + ONE )
	PRINT *, NEGZRO
      IF( NEGZRO .NE. ZERO ) THEN
        IEEECK = 0
        RETURN
      END IF

      NEGINF = ONE / NEGZRO
	PRINT *, NEGINF
      IF( NEGINF .GE. ZERO ) THEN
        IEEECK = 0
        RETURN
      END IF

      NEWZRO = NEGZRO + ZERO
	PRINT *, NEWZRO
      IF( NEWZRO .NE. ZERO ) THEN
        IEEECK = 0
        RETURN
      END IF

      POSINF = ONE / NEWZRO
	PRINT *, POSINF
      IF( POSINF .LE. ONE ) THEN
        IEEECK = 0
        RETURN
      END IF

      NEGINF = NEGINF * POSINF
	PRINT *, NEGINF
      IF( NEGINF .GE. ZERO ) THEN
        IEEECK = 0
        RETURN
      END IF

      POSINF = POSINF * POSINF
	PRINT *, POSINF
      IF( POSINF .LE. ONE ) THEN
        IEEECK = 0
        RETURN
      END IF
!
!        Return if we were only asked to check infinity arithmetic
!
      IF( ISPEC .EQ. 0 ) RETURN

      NAN1 = POSINF + NEGINF
      NAN2 = POSINF / NEGINF
      NAN3 = POSINF / POSINF
      NAN4 = POSINF * ZERO
      NAN5 = NEGINF * NEGZRO
      NAN6 = NAN5 * 0.0
      IF( NAN1 .EQ. NAN1 ) THEN
        IEEECK = 0
        RETURN
      END IF

      IF( NAN2 .EQ. NAN2 ) THEN
        IEEECK = 0
        RETURN
      END IF

      IF( NAN3 .EQ. NAN3 ) THEN
        IEEECK = 0
        RETURN
      END IF

      IF( NAN4 .EQ. NAN4 ) THEN
        IEEECK = 0
        RETURN
      END IF

      IF( NAN5 .EQ. NAN5 ) THEN
        IEEECK = 0
        RETURN
      END IF

      IF( NAN6 .EQ. NAN6 ) THEN
        IEEECK = 0
        RETURN
      END IF
      RETURN
      END
