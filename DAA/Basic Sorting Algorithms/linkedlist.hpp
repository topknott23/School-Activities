#include "list.hpp"
#include <cstdlib>
#include <iostream>
using namespace std;

// WARNING! Do not modify this struct!
// Doing so will nullify your score for this activity.
struct node {
    int element;
    node* next;
};

/**
 * This implementation is of a Singly-Linked List.
 * Feel free to add helper methods. You might want the create_node helper method.
 */
class LinkedList : public List {
    node* head;
    node* tail;
    int index;

    node* create_node(int num) {
      node* newNode = new node;
      newNode->element = num;
      newNode->next = NULL;
      return newNode;
    }

    public:
        LinkedList() : head(NULL), tail(NULL), index(0) {}

        int add(int num) {
          node* newNode = create_node(num);
          if(!head){
              head = tail = newNode;
          }else{
              tail->next = newNode;
              tail = newNode;
          }
          return index++;
        }

        int get(int pos) {
       
          node* curr = head;
          for(int i = 0; i < pos; i++) curr = curr->next;
          
          return curr->element;
        }

        int size() {
            return index;
        }

        void swap(int pos1, int pos2) {
          
            //2
            node *prev1 = NULL, *curr1 = head;
            
            //5pos1 + 2
            for(int i = 0; i < pos1; i++) { 
                prev1 = curr1; curr1 = curr1->next;
                
            }
            //2
            node *prev2 = NULL, *curr2 = head;
            //5pos2 + 2
            for(int i = 0; i < pos2; i++){ prev2 = curr2; curr2 = curr2->next;}
            
            //3
            if(prev1) prev1->next = curr2;
            else head = curr2;
            //3
            if(prev2) prev2->next = curr1;
            else head = curr1;
            //7
            node* temp = curr1->next;
            curr1->next = curr2->next;
            curr2->next = temp;
            //6
            if(curr1->next == NULL) tail = curr1;
            if(curr2->next == NULL) tail = curr2;
            
            //5pos1 + 5pos2 + 27
        }
        

        // WARNING! Do not modify this method below!
        // Doing so will nullify your score for this activity.
        void print() {
            node* currnode = head;
            if (head == NULL && tail == NULL) {
                cout << "(empty)";
                return;
            }
            while (true) {
                cout << currnode->element;
                if (currnode == tail) {
                    cout << endl;
                    return;
                }
                cout << " -> ";
                currnode = currnode->next;
            }
        }
};