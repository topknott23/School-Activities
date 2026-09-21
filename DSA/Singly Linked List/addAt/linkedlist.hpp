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

    int remove(int num) {
        // IGNORE for now
        return -1;
	}

    // TODO implement method addAt here
    void addAt(int num, int pos){
        
        if(size == 0){
            node* n = new node();
            n->elem = num;
            n->next = NULL;
            head = n;
            tail = n;
        size++;
        return;
        }
        
        if(pos == 1){
            node* n = new node();
            n->elem = num;
            n->next = head;
            head = n;
            size++;
            return;
        }
        
        if(pos > size){
            node* n = new node();
            n->elem = num;
            n->next = NULL;
            tail->next = n;
            tail = n;
            size++;
            return;
        }
        
        int count = 0;
        node*curr = head;
        for(int i = 1; i < pos - 1; i++){
            curr = curr->next;

        }
            node* n = new node();
            n->elem = num;
            n->next = curr->next;
            curr->next = n;
            size++;
            
    //     if(pos == 1){
    //         node* c = new node;
    //         c->elem = num;
    //         c->next = head;
    //         head = c;
    //         size++;
    //         return;
    //     }
      
      
    //   if(pos > size){
          

    // node* bb = head;
       
    //   node *curr = head;
    
    //     while(curr->next != NULL){
    //         curr= curr->next;
    //     }
     
      
    //   node* b = new node;
       
       
    //   b->elem = num;
    //   b->next = NULL;
    //     curr->next = b;
    //   tail = b;
        
      
    //     size++;
        
    //     return;
    //   }
      
      
      
      
       
    //   node* n = head;
       
    //   int ind = 1;
    //   node* a = new node;
      
      
      
    //   while(ind != pos-1){
    //       n = n->next;
    //       ind++;
    //   }
       
    //   a->elem = num;
    //   a->next = n->next;
       
    //   n->next = a;
    //   size++;
   
    
       
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