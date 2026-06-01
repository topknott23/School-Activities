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

    // TODO implement method flip here
    void flip(){
        int arr[5];
        int count = 0;
        for(int i = size-1; i >=0 ; i--){
            arr[i] = array[count++];
        }
        for(int i = 0; i < size; i++){
            array[i] = arr[i];
        }
    }

    void print() {
        for (int i = 0; i < 5; i++) {
            cout << array[i] << " ";
        }
        cout << endl;
    }
};