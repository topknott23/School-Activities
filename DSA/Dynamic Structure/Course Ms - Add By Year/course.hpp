#include <iostream>
#include "student.hpp"
#include <cmath>
using namespace std;
class Course {
	string topic;
	Student** students;
	int size;
	int capacity;

	public:
	// TODO constructor
	Course(string topic) {
        this->topic = topic;
        this->capacity = 5;
        this->size = 0;
        this->students = new Student*[capacity];
    }

	// TODO add student
	void addStudent(Student* s) {
if (size == capacity) {
            int add = ceil(capacity * 0.5);
            int newCap = capacity + add;
            Student** newArr = new Student*[newCap];
            for (int i = 0; i < size; i++) newArr[i] = students[i];
            delete[] students;
            students = newArr;
            capacity = newCap;
        }

        int pos = size;
        for (int i = 0; i < size; i++) {
            if (s->year > students[i]->year) {
                pos = i;
                break;
            }
            if (s->year == students[i]->year) {
                pos = i + 1;
            }
        }

        for (int i = size; i > pos; i--) {
            students[i] = students[i - 1];
        }

        students[pos] = s;
        size++;
    
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