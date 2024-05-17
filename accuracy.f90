!***************************************************************************!
! accuracy computes machine parameters of floating point.                   !
! Version date: 17.05.2024                                                  !
!***************************************************************************!
      program accuracy    
      real *4  eps_r,tiny_r,huge_r,s_r
      real *8  eps_d,tiny_d,huge_d,s_d
      real *16 eps_q,tiny_q,huge_q,s_q
      eps_r = 1.0E0
      eps_d = 1.0D0
      eps_q = 1.0Q0
   10 eps_r = eps_r / 2.0E0
      s_r = 1.0E0 + eps_r
      if ( s_r .GT. 1.0E0 ) go to 10
      eps_r = 2.0E0 * eps_r
      s_r = 1.0E0
   20 tiny_r = s_r
      s_r = s_r / 16.0E0
      if ( s_r * 1.0E0 .NE. 0.0E0 ) go to 20
      tiny_r = ( tiny_r / eps_r ) * 100.0E0
      huge_r = 1.0E0 / tiny_r
   30 eps_d = eps_d / 2.0D0
      s_d = 1.0D0 + eps_d
      if ( s_d .GT. 1.0D0 ) go to 30
      eps_d = 2.0D0 * eps_d
      s_d = 1.0D0
   40 tiny_d = s_d
      s_d = s_d / 16.0D0
      if ( s_d * 1.0D0 .NE. 0.0D0 ) go to 40
      tiny_d = ( tiny_d / eps_d ) * 100.0D0
      huge_d = 1.0D0 / tiny_d
   50 eps_q = eps_q / 2.0Q0
      s_q = 1.0Q0 + eps_q
      if ( s_q .GT. 1.0Q0 ) go to 50
      eps_q = 2.0Q0 * eps_q
      s_q = 1.0Q0
   60 tiny_q = s_q
      s_q = s_q / 16.0Q0
      if ( s_q * 1.0Q0 .NE. 0.0Q0 ) go to 60
      tiny_q = ( tiny_q / eps_q ) * 100.0Q0
      huge_q = 1.0Q0 / tiny_q
      write(*,*) eps_r, tiny_r, huge_r
      write(*,*) eps_d, tiny_d, huge_d
      write(*,*) eps_q, tiny_q, huge_q
      end

