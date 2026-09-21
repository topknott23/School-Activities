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
	
	int removeAt(int pos){
	    
	    node* curr = head;
	    node* currr = head;
	    if(pos == 1){
	        
	        node* toRemove = head;
	        head = head->next;
	        int temp = toRemove->elem;
	        size--;
	        delete toRemove;
	        return temp;
	    }
	    
	    if(pos == size){
	        node* toRemove = tail;
	        while(curr->next != tail){
	            curr = curr->next;
	        }
	        tail = curr;
	        int temp = toRemove->elem;
	        size--;
	        delete toRemove;
	        return temp;
	    }
	    
	    for(int i = 1; i < pos-1; i++){
	        currr = currr->next;
	    }
	    node* toRemove = currr->next;
	    currr->next = toRemove->next;
	    int temp = toRemove->elem;
	    size--;
	    delete toRemove;
	    return temp;
	    
	   
	    
	}
	    
// 	    if(pos == size-1){
// 	        while(curr){
// 	            if(curr->next->next == NULL){
// 	                 node* toRemove = curr->next;
// 	             curr->next = NULL;
// 	             tail = curr;
// 	             temp = toRemove->elem;
// 	             delete toRemove;
// 	            }
// 	            curr = curr->next;
// 	        }
// 	                size--;
	        
// 	                return temp;
	        
// 	    }
	    
// 	}
	   // for(int i = 0; i < pos; i++){
	   //     curr = curr->next;
	   // }
	    
	  
	   //node* toremove = curr->next;
	   //temp = toremove->elem;
	   //curr->next = toremove->next;
	   
	   //delete toremove;
	   
	   //return temp;
	    

    // TODO add the removeAt method


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