#include "list.hpp"
#include "node.hpp"
#include <iostream>
using namespace std;

class LinkedList : public List {
	node *head = new node(-1);
	node *tail = new node(-1);
	head->next = tail;
	tail->prev = head;
	int size;

public:

  
    
	void addFirst(int num) {
	    
	    
	    node* a = new node();
	    a->elem = num;
	    a->next = head->next;
	    a->prev = head;
	    
	    head->next->prev = a;
	    head->next = a;
	    
	    size++;
	    
	   // node* n = new node();
	   // n->elem = num;
	   // n->next = NULL;
	   // if(head == NULL){
	   //     head = tail = n;
	   // }else{
	   //     n->next = head;
	   //     head->prev = n;
	   //     head = n;
	   // }
	   // size++;
	}
	void addLast(int num) {
	    // TODO
	    node* n = new node();
	    n->elem = num;
	    n->next = NULL;
	    if(tail == NULL){
	        head = tail = n;
	    }else{
	        tail->next = n;
	        n->prev = tail;
	        tail = n;
	    }
	    size++;
	    
	}

	void add(int num) {
		addLast(num);
	}

	int remove(int num) {
        // IGNORE for now
    	return 0;
	}

    // TODO implement method get here
	int get(int pos) {
        return 0;
	}

    void print() {
    	node* curr;
    	if (size == 0) {
    		cout << "Empty" << endl;
		} else {
			cout << "From HEAD: ";
    		curr = head;
	    	while (true) {
	    		cout << curr->elem;
	    		if (curr != tail) {
	    			cout << " -> ";
				} else {
					cout << endl;
                    break;
				}
	    		curr = curr->next;
			}
			cout << "From TAIL: ";
    		curr = tail;
	    	while (true) {
	    		cout << curr->elem;
	    		if (curr != head) {
	    			cout << " <- ";
				} else {
					cout << endl;
                    break;
				}
	    		curr = curr->prev;
			}
		}
    }
};