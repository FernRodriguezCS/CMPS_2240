#include <iostream>
#include <string>

int main(int argc, char* argv[]) {
    char c;

    if (argc >= 2 && argv[1][0] != '\0') {
        c = argv[1][0];
    } else {
        std::cout << "Enter a character: ";
        if (!std::cin.get(c)) {
            std::cerr << "Error: no input provided.\n";
            return 1;
        }
    }

    unsigned char uc = static_cast<unsigned char>(c);
    std::cout << "ASCII value: " << static_cast<int>(uc) << "\n";
    return 0;
}
