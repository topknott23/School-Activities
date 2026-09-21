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
		node* n = (node*) calloc( 1, sizeof(node) );
		n->elem = num;
		if (size == 0) {
			head = n;
		} else {
			tail->next = n;
		}
		tail = n;
		size++;
	}

    int get(int pos) {
        // IGNORE for now
        return 0;
    }

    int remove(int num) {
        // IGNORE
        return 0;
	}

    // TODO add the removeAll method
    int removeAll(int num){
        
        node* curr = head;
        node* prev;
        int ctr = 0;
        while(curr){
        if(curr->elem == num){
            if(curr == head){
                head = head->next;
                curr = head;
            }else{
                if(curr == tail){
                    tail = prev;
                }
                prev->next = curr->next;
                curr = prev->next;
    }
    size--;
    ctr++;
    }else{
    prev = curr;
    curr = curr->next;
    }
    }
return ctr;
}

        
        // int count = 0;
        
        
        // if(head->next->elem == num){
        //     node* torem = head->next;
        //     head->next = torem->next;
        //     delete torem;
        //     size--;
        //     count++;
        // }
        // if(head->elem == num){
        //     node* torem = head;
        //     head = head->next;
        //     delete torem;
        //     size--;
        //     count++;
        // }
        
        // node* curr = head;
        
        // while(curr->next != NULL){
        //     if
        //     if(curr->next->elem == num){
        //         node* torem = curr->next;
        //         curr->next = torem->next;
        //         delete torem;
        //         size--;
        //         count++;
        //     }
        //     curr = curr->next;
        // }
        
        
        
        // return count;
    

    // DO NOT modify the code below.
    void print() {
    	node* curr = head;
    	if (size == 0) {
    		cout << "Empty" << endl;
		} else {
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
		}
    }
};