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
   void shift(int i){
       for(int j = i ; j < size; j++){
           array[j] = array[j + 1];
       }
   }
   
  int remove(int num){

        for(int i = 0; i < size; i++){
            if(array[i] == num){
              
                shift(i);
                size--;
                return i + 1;
            }
        }
      
      return -1;
      
    }
   


    void print() {
        for (int i = 0; i < 5; i++) {
            cout << array[i] << " ";
        }
        cout << endl;
    }
};