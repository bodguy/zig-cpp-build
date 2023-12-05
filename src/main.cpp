#include <iostream>
#include <dep.h>

int factorial(int n) {
  if (n == 0)
    return 1;
  else
    return n * factorial(n-1);
}

int main(int argc, char** argv) {
    int result = add(1, 2);
    std::cout << result << '\n';
    std::cout << "Hello World!!\n"; 
    printf("factorial(8): %d", factorial(8));
    return 0;
}