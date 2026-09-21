#include "list.hpp"
#include "node.hpp"
#include <iostream>
using namespace std;

class LinkedList : public List {
	node *head, *tail;
	int size;

public:

void addFirst(int num) {
	    
	    node* n = new node();
	    n->elem = num;
	    n->next = NULL;
	    if(head == NULL){
	        head = tail = n;
	    }else{
	        n->next = head;
	        head->prev = n;
	        head = n;
	    }
	    size++;
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
	
	int removeFirst(){
	    
	    if(head == NULL){
	 
	        return -1;
	    }
	    
	    
	    
	    
	    if(head->next == NULL){
	        size--;
	        node* torem = head;
	        head = NULL;
	        tail = NULL;
	        int temp = torem->elem;
	        return temp;
	    }
	    
	    
	    node* torem = head;
	    
	    head = head->next;
	    
	    
	    
	    head->prev = NULL;
	    int temp = torem->elem;
	    delete torem;
	    
	   
	    size--;
	    return temp;
	    
	}
	
	int removeLast(){
	    
	    if(head == NULL && tail == NULL){
	        return -1;
	    }
	    
	    if(tail->prev == NULL){
	        node* torem = tail;
	        head = NULL;
	        tail = NULL;
	        size--;
	        int temp = torem->elem;
	        return temp;
	    }
	    
	    node* torem = tail;
	    tail = tail->prev;
	    tail->next = NULL;
	    int temp = torem->elem;
	    delete torem;
	    size--;
	    return temp;
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