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

    // TODO implement get method
    int get(int pos) {

     node* curr = head;
     
     for(int i = 0; i < pos-1; i++){
  
         curr = curr->next;
     }
     return curr->elem;
    }

    int remove(int num) { // IGNORE
        return -1;
	}

    // DO NOT MODIFY the lines below.
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