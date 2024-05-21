{***************************************************************************}
{ accuracy computes machine parameters of floating point.                   }
{ Version date: 21.05.2024                                                  }
{***************************************************************************}
program accuracy;
var
  eps_r, tiny_r, huge_r,s_r : real;
  eps_d, tiny_d, huge_d,s_d : double;
  eps_q, tiny_q, huge_q,s_q : extended;
begin
  eps_r := 1;
  eps_d := 1;
  eps_q := 1;
  repeat
    eps_r := eps_r / 2;
    s_r := 1 + eps_r;
  until (s_r = 1);
  eps_r := 2 * eps_r;
  s_r := 1;
  repeat
    tiny_r := s_r;
    s_r := s_r / 16;
  until ( s_r * 1 = 0 );
  tiny_r := ( tiny_r / eps_r ) * 100;
  huge_r := 1 / tiny_r;
  repeat
    eps_d := eps_d / 2;
    s_d := 1 + eps_d;
  until ( s_d = 1 );
  eps_d := 2 * eps_d;
  s_d := 1;
  repeat
    tiny_d := s_d;
    s_d := s_d / 16;
  until ( s_d * 1 = 0 );
  tiny_d := ( tiny_d / eps_d ) * 100;
  huge_d := 1 / tiny_d;
  repeat
    eps_q := eps_q / 2;
    s_q := 1 + eps_q;
  until ( s_q = 1 );
  eps_q := 2 * eps_q;
  s_q := 1;
  repeat
    tiny_q := s_q;
    s_q := s_q / 16;
  until ( s_q * 1 = 0 );
  tiny_q := ( tiny_q / eps_q ) * 100;
  huge_q := 1 / tiny_q;
  writeln( eps_r, tiny_r, huge_r );
  writeln( eps_d, tiny_d, huge_d );
  writeln( eps_q, tiny_q, huge_q );
  writeln( sizeof(real), ' ', sizeof(double), ' ', sizeof(extended));
 end.

