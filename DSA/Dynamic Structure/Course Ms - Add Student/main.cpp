#include <iostream>
#include "course.hpp"
using namespace std;

int main(int argc, char** argv) {
	Course* csit = new Course("CSIT221");
	char op;
	Student* s;
	while (true) {
		cout <<"Op: ";
		cin >> op;
		switch (op){
			case 'a':
				s = new Student;
				cout << "Name: ";
				cin >> s->name;
				cout << "Program and Year: ";
				cin >> s->program >> s->year;
				csit->addStudent(s);
				break;
			case 'p':
				csit->print();
				break;
			case 'x':
			    cout << "Exiting" << endl;
				return 0;
		}
	}
	return 0;
}