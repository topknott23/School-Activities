#include <cstdlib>
#include <iostream>
#include "list.hpp"
#include "node.hpp"
using namespace std;

class LinkedList : public List {
	node* head = NULL;
	node* tail = NULL;
	int size = 0;

	public:
	void add(int num) {
	    // IGNORE
	}

    int get(int pos) {
        // IGNORE for now
        return 0;
    }

    int remove(int num) { // IGNORE
        return -1;
	}
    
    void addHead(int num){
    
    node* neww = new node();
    neww->elem = num;
    if(head == NULL){
        tail = neww;
        
    }
    neww->next = head; 
    head = neww;
    size++;

    }
    
    void addTail(int num){
        
        node* newNode = new node();
        newNode->elem = num;
        newNode->next = NULL;
        if(size == 0){
        head = newNode;
   
        }else{
            tail->next = newNode;
        }
        tail = newNode;
       
        size++;
    }
    // TODO implement addHead and addTail

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