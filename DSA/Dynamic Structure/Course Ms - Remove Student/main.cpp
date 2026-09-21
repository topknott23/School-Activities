#include <iostream>
#include "course.hpp"
using namespace std;

int main(int argc, char** argv) {
	Course* csit = new Course("CSIT221");
	char op;
	Student* s;
	string res;
	string name;
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
			case 'r':
			    cout << "Who to remove? ";
			    cin >> name;
			    res = csit->removeStudent(name);
			    if (res != "") {
			        cout << "Removed student from " << res << endl;
			    } else {
			        cout << "No name " << name << " in list" << endl;
			    }
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