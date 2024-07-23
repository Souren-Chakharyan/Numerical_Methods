!****************************************************************************
! sieve prints prime numbers between 1 and 1 000 000 (from Watcom compiler).!
! Version date: 17.05.2024                                                  !
!****************************************************************************
    program sieave
    implicit none
    integer UPBOUND
    parameter (UPBOUND=1000000)
    integer I, K, PRIMES
    logical*1 NUMBERS(2:UPBOUND)
    CHARACTER*11 FORM
    PARAMETER (FORM='(A,I7,A,I7)')
    DO I = 2, UPBOUND
      NUMBERS(I) = .TRUE.
    ENDDO
    PRIMES = 0
    DO I = 2, UPBOUND
      IF( NUMBERS(I) )THEN
        PRINT '(I8)', I
        PRIMES = PRIMES + 1
        DO K = I + I, UPBOUND, I
          NUMBERS(K) = .FALSE.
        ENDDO
      ENDIF
    ENDDO
    PRINT FORM, 'The Number of Primes between 1 and ', UPBOUND, ' are: ', PRIMES
    end program sieave

