#include <cstdlib>
#include <iostream>
#include "list.hpp"
#include "node.hpp"
using namespace std;

class LinkedList : public List {
	node* head;
	node* tail;
	int size;

	public:
	void add(int num) {
       node* newNode = (node*) calloc(1, sizeof(node));
        newNode->elem = num;
        
        if(size == 0){
       head = newNode;
   
        }else{
            tail->next = newNode;
        }
        tail = newNode;
        size++;
	}

    int get(int pos) {
        // IGNORE for now
        return 0;
    }

    // TODO the remove method
    int remove(int num) {
    node* curr = head;
    node* prev = nullptr;   // make it explicit that prev is "nothing" at the start
    int pos = 1;

    while (curr) {
        if (curr->elem == num) {
            // Case 1: removing the head
            if (prev == nullptr) {
                head = curr->next;
            }
            // Case 2: removing a middle or tail node
            else {
                prev->next = curr->next;
            }

            // Update tail if we removed the last node
            if (curr == tail) {
                tail = prev;
            }

            delete curr;  // free memory
            size--;
            return pos;
        }

        prev = curr;
        curr = curr->next;
        pos++;
    }

    return -1; // element not found
}

    void print() {
    	node* curr = head;
    	if (size == 0) {
    		cout << "Empty" << endl;
		} else {
	    	do {
	    		cout << curr->elem;
	    		if (curr->next) {
	    			cout << " -> ";
				} else {
					cout << endl;
				}
	    		curr = curr->next;
			} while (curr);
		}
    }
};