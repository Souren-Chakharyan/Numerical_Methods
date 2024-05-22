//***************************************************************************//
// accuracy computes machine parameters of floating point.                   //
// Version date: 21.05.2024                                                  //
//***************************************************************************//
#include <iostream>
int main( void )
{
    float eps_r, tiny_r, huge_r, s_r;
    double eps_d, tiny_d, huge_d, s_d;
    long double eps_q, tiny_q, huge_q, s_q;

eps_r = 1.0F;
eps_d = 1.0;
eps_q = 1.0L;
    do {
        eps_r = eps_r / 2.0F;
        s_r = 1 + eps_r;
    } while (s_r > 1.0F);
    eps_r = 2.0F * eps_r;
    s_r = 1.0F;
    do {
        tiny_r = s_r;
        s_r = s_r / 16.0F;
    } while (s_r * 1.0F != 0.0F);
    tiny_r = (tiny_r / eps_r) * 100.0F;
    huge_r = 1.0F / tiny_r;
    do {
        eps_d = eps_d / 2.0;
        s_d = 1.0 + eps_d;
    } while (s_d > 1.0);
    eps_d = 2.0 * eps_d;
    s_d = 1.0;
    do {
        tiny_d = s_d;
        s_d = s_d / 16.0;
    } while (s_d * 1.0 != 0.0);
    tiny_d = (tiny_d / eps_d) * 100.0;
    huge_d = 1.0 / tiny_d;
    do {
        eps_q = eps_q / 2.0L;
        s_q = 1.0L + eps_q;
    } while (s_q != 1.0L);
    eps_q = 2.0L * eps_q;
    s_q = 1.0L;
    do {
        tiny_q = s_q;
        s_q = s_q / 16.0L;
    } while (s_q * 1.0L != 0.0L);
    tiny_q = (tiny_q / eps_q) * 100.0L;
    huge_q = 1.0L / tiny_q;
    std::cout << eps_r << " " << tiny_r << " " << huge_r << "\n";
    std::cout << eps_d << " " << tiny_d << " " << huge_d << "\n";
    std::cout << eps_q << " " << tiny_q << " " << huge_q << "\n";
    std::cout << sizeof(float) << " " << sizeof(double) << " " << sizeof(long double);
}
