#include "node.hpp"
#include <iostream>
using namespace std;
class LinkedList {
	// IMPLEMENT ME
	node* head;
	int size;

    public:
    LinkedList() : head(nullptr){
        size = 0;
    }
        
        void insert(string key){
            node* newNode = new node;
            newNode->elem = key;
            
            if(!head){
                newNode->next = head;
                head = newNode;
            }else{
                node* curr = head;
                while(curr){
                    if(curr->next == NULL){
                        curr->next = newNode;
                        newNode->next = NULL;
                    }
                    curr = curr->next;
                }
            }
            size++;
        }
        
        bool contains(string key){
            node* curr = head;
            while(curr){
                if(curr->elem == key) return true;
                curr = curr->next;
            }
            return false;
        }
        
        bool remove(string key){
            node* curr = head;
            node* prev = nullptr;
            while(curr){
                if(curr->elem == key){
                    if(prev) prev->next = curr->next;
                    else head = curr->next;
                    delete curr;
                    size--;
                    return true;
                }
                prev = curr;
                curr = curr->next;
            }
            return false;
            
        }
        
        int getSize(){return size;}
        
        void print(){
            node* curr = head;
            while(curr){
                cout << "\t" << curr->elem;
                curr=curr->next;
            }
        }
};