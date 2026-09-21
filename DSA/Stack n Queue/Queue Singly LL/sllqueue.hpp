// TODO implement the queue using the operations of Singly Linked List
#include "queue.hpp"
#include "node.hpp"
class SLLQueue : public Queue {
    node *head ,*tail;
    int count;


    public:
    SLLQueue(){
        head = tail = nullptr;
        count = 0;
    }
    
    void enqueue(int num){
        node* newNode = new node();
        if(!head){
            newNode->elem = num;
            newNode->next = nullptr;
            head = tail = newNode;
            count++;
            return;
        }
        
        newNode->elem = num;
        newNode->next = nullptr;
        tail->next = newNode;
        tail = newNode;
        count++;
        return;
    }
    
    int dequeue(){
        if(!head){
            return 0;
        }
        node* temp = head;
        head = head->next;
        int val = temp->elem;
        delete temp;
        count--;
        return val;
    }
    
    int first(){
        if(!head){
            return 0;
        }
        return head->elem;
    }
    int size(){
        return count;
    
    }
    
    bool isEmpty(){
        return count == 0;
    }
};