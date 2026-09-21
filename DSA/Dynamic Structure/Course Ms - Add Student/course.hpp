#include <iostream>
#include <cmath>
#include "student.hpp"
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
		for (int i = 0; i < capacity; i++) {
			students[i] = nullptr;
	}
}
	
	void addStudent(Student* s) {
        if (size == capacity) {
			
			int extra = ceil(capacity * 0.5);
			int newCapacity = capacity + extra;

			
			Student** newArr = new Student*[newCapacity];
			
			
			for (int i = 0; i < size; i++) {
				newArr[i] = students[i];
			}


			for (int i = size; i < newCapacity; i++) {
				newArr[i] = nullptr;
			}


			delete[] students;

			
			students = newArr;
			capacity = newCapacity;
		}

	
		students[size++] = s;
	
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