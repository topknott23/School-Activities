#include <iostream>
#include "student.hpp"
#include "hidden.hpp"
using namespace std;
class Course {
	string topic;
	Student** students;
	int size;
	int capacity;

	public:
	Course(string topic) {
		students = hidden_init(topic, &this->topic, &size, &capacity);
	}

	void addStudent(Student* s) {
	    students = hidden_addStudent(s, &size, &capacity, students);
	}

	string removeStudent(string name) {
   int index = -1;
        for (int i = 0; i < size; ++i) {
            if (students[i]->name == name) {
                index = i;
                break;
            }
        }
        if (index == -1) return "";

        string program = students[index]->program;
        delete students[index];

        for (int i = index; i < size - 1; ++i) {
            students[i] = students[i + 1];
        }
        students[size - 1] = nullptr;
        --size;

        
        if (capacity > 5 && size > 0 && size <= (2 * capacity) / 3) {
            int shrinkBy = capacity / 4; 
            int newCapacity = capacity - shrinkBy;
            if (newCapacity < 5) newCapacity = 5;

            if (newCapacity < capacity) {
                Student** newArr = new Student*[newCapacity];
                for (int i = 0; i < size; ++i) newArr[i] = students[i];
                for (int i = size; i < newCapacity; ++i) newArr[i] = nullptr;

                delete[] students;
                students = newArr;
                capacity = newCapacity;
            }
        }

        return program;
    }

	

	// DO NOT MODIFY
	void print() {
		cout << "Title: "<< topic << endl;
		cout << "Student size: " << size << "/" << capacity << endl;
		for (int i = 0; i < capacity; i++) {
			if (i >= size) {
				cout << i+1<< ". (none)" << endl;
			} else {
			    Student* s = students[i];
				cout << i+1 << ". " << s->name << " (" << s->program << " " << s->year << ")" << endl;
			}
		}
	}
};