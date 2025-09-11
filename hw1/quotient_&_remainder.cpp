#include <iostream>
#include <string>

int main(int argc, char* argv[]) {
    if (argc != 3) {
        std::cout << "usage: " << argv[0] << " <dividend> <divisor>\n";
        return 1;
    }

    try {
        long long dividend = std::stoll(argv[1]);
        long long divisor = std::stoll(argv[2]);

        if (divisor == 0) {
            std::cout << "Error: division by zero is undefined.\n";
            return 1;
        }

        long long quotient = dividend / divisor;
        long long remainder = dividend % divisor;

        std::cout << "Quotient: " << quotient << "\n";
        std::cout << "Remainder: " << remainder << "\n";
    } catch (const std::exception&) {
        std::cout << "Error: both arguments must be valid integers.\n";
        return 1;
    }

    return 0;
}
