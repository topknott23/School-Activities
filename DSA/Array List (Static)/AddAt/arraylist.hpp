#include <iostream>
#include "list.hpp"
using namespace std;

class ArrayList : public List {
    int array[5];
    int size;

    public:
    void add(int num) {
        if (size < 5) {
            array[size++] = num;
        } else {
            cout << "Array full" << endl;
        }
    }

    int get(int pos) {
        return array[pos-1];
    }
    
 
   void addAt(int num, int pos){
       for(int i = size; i > pos - 1; i--){
           array[i] = array[i - 1];
           
       }
       size++;
       array[pos - 1] = num;
   }
    
  
    
    
    void print() {
        for (int i = 0; i < 5; i++) {
            cout << array[i] << " ";
        }
        cout << endl;
    }
};