#include <iostream>
#include "message.pb.h"

void hey(tutorial::Person &p) {
    std::cout << "Hey " << p.name() << "!\n";
}

int main () {
    tutorial::Person person;
    person.set_name("Ishank");
    hey(person);
}