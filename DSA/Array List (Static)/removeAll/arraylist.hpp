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

    // TODO implement method removeAll here
    
      int removeAll(int num){
          int count = 0;
    for(int i = 0 ; i < size; i++){
        
        if(array[i] == num){
            for(int j = i; j < size; j++){
                array[j] = array[j + 1];
            }
            array[size - 1] = 0;
            size--;
            count++;
            i--;
        }
    }
    return count;
    }
    
//     int removeAll(int num){
//     int ctr = 0;
//     for(int i = 0; i < size; i++){
//         if(array[i] == num){
//             for(int j = i; j < size - 1; j++){
//                 array[j] = array[j+1];
//             }
//             array[size-1] = 0;
//             size = size-1;
//             i--;
//             ctr++;
//         }
//     }
//   return ctr;
//     }
    
    

    void print() {
        for (int i = 0; i < 5; i++) {
            cout << array[i] << " ";
        }
        cout << endl;
    }
};