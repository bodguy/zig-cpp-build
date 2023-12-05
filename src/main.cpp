#include <iostream>
#include <string>
#include <vector>
 #include <dep.h>

class Person {
public:
    explicit Person(const std::string& name) {
        this->name = name;
    }

    void add_hobby(const std::string& x) {
        this->hobby.push_back(x);
    }

    void print_hobby() const {
        for (const auto& i : hobby) {
            std::cout << i << std::endl;
        }
    }

private:
    std::string name;
    std::vector<std::string> hobby;
};

int main(int argc, char** argv) {
     int result = add(1, 2);
     std::cout << result << '\n';
     std::cout << "Hello World!!\n";
     printf("factorial(8): %d\n", factorial(8));

    Person* person = new Person("bodguy");
    person->add_hobby("programming");
    person->add_hobby("work out");
    person->print_hobby();

    delete person;
    return 0;
}
