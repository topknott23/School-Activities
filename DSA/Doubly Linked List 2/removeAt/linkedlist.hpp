#include "list.hpp"
#include "node.hpp"
#include <iostream>
using namespace std;

class LinkedList : public List {
	node *head, *tail;
	int size;

public:
	void addFirst(int num) {
		// STEP 1: Create node n
		node* n = (node*) calloc( 1, sizeof(node) );
		n->elem = num;
		// STEP 2: Connect n to head
		n->next = head;
		if (head) {
			head->prev = n;
		}
		// STEP 3: Reassign head
		head = n;
		if (!tail) {
			tail = n;
		}
		// STEP 4: Update size
		size++;
	}
	void addLast(int num) {
		// STEP 1: Create node n
		node* n = new node;
		n->elem = num;
		n->next = NULL;
		// STEP 2: Connect tail to n
		if (tail) {
			tail->next = n;
		} else {
			head = n;
		}
		n->prev = tail;
		// STEP 3: Reassign tail
		tail = n;
		// STEP 4: Update size
		size++;
	}

	void removeFirst() {
		if (!head) {
			return;
		}
		head = head->next;
		if (head) {
			free(head->prev);
			head->prev = nullptr;
		} else {
			free(tail);
			tail = nullptr;
		}
		size--;
	}

	void removeLast() {
		if (!tail) {
			return;
		}
		tail = tail->prev;
		if (tail) {
			free(tail->next);
			tail->next = nullptr;
		} else {
			free(head);
			head = nullptr;
		}
		size--;
	}

	void add(int num) {
		addLast(num);
	}

    int remove(int num) {
        // IGNORE for now
        return 0;
	}

    // TODO implement method removeAt here
    int removeAt(int pos){
        int temp;
            if(head == NULL){
                return -1;
            }
            
            node* torem = head;
        if(pos == 1){
            head = head->next;
            if(head) head->prev = NULL;
            else tail = NULL;
            temp = torem->elem;
            delete torem;
            size--;
            return temp;
        }
        
        else if(pos == size){
            torem = tail;
            tail = tail->prev;
            tail->next = NULL;
            temp = torem->elem;
            delete torem;
            size--;
            return temp;
            
        }
        else{
            for(int i = 0; i < pos-1; i++){
                torem = torem->next;
            }
            torem->prev->next = torem->next;
            torem->next->prev = torem->prev;
            temp = torem->elem;
            delete torem;
            size--;
            return temp;
        }
        
        size--;
        return-1;
        
        
    }

	int get(int pos) {
        // IGNORE for now
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