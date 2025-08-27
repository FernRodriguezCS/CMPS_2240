#include <iostream>
#include <cstdlib>   // for atoi
using namespace std;

int main(int argc, char* argv[]) {
    if (argc != 3) {
        cout << "Usage: " << argv[0] << " <num1> <num2>" << endl;
        return 1; // non-zero exit code for error
    }

    int a = atoi(argv[1]);
    int b = atoi(argv[2]);
    int product = a * b;

    cout << a << " * " << b << " = " << product << endl;
    
    return 0;
}