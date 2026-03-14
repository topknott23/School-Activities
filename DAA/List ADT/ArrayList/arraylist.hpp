#include "list.hpp"
#include <iostream>
#include <cmath>
using namespace std;

class ArrayList : public List{
    int* array, tosize, cap;
    
    void up(){
        int newCap = cap + ceil(cap * 0.5);
        int* newArr = (int*) realloc(array, newCap * sizeof(int));
        array = newArr;
        cap = newCap;
    }
    void down(){
        int newCap = cap - cap / 4;
        if(newCap < 5) newCap = 5;
        int* newArr = (int*) realloc(array, newCap * sizeof(int));
        array = newArr;
        cap = newCap;
    }
    
    public:
    ArrayList(){
        array = (int*)malloc(5 * sizeof(int));
        cap = 5;
    }
    
    void insert(int num){
        if(tosize >= cap) up();
        array[tosize++] = num;
    }
    
    int get(int pos){
        if(pos < 0 || pos > tosize) throw out_of_range("Invalid position");
        return array[pos-1];
    }
    
    void addAt(int num, int pos){
        if(pos > cap) throw out_of_range("Invalid position");
        if(tosize >= cap) up();
        for(int i = tosize; i > pos-1;i--){
            array[i]=array[i-1];
        }
        array[pos-1] = num;
        tosize++;
    }
    int remove(int num){
        for(int i = 0; i < tosize; i++){
            if(array[i] == num){
                for(int j = i; j < tosize - 1; j++){
                    array[j] = array[j + 1];
                }
                tosize--;
                if(tosize <= (2 * cap) / 3){
                    down();
                }
                return i + 1;
            }
        }
        return 0;
    }
    
    int removeAt(int pos){
        if(pos < 0 || pos > tosize) throw out_of_range("Invalid position");
        int removed = array[pos-1];
        for(int i = pos-1; i < tosize - 1; i++){
            array[i] = array[i+1];
        }
        tosize--;
        if(tosize <= (2* cap) / 3){
            down();
        }
        return removed;
    }
    int size(){ return tosize;}
    bool isEmpty(){return tosize == 0;}
    void print(){
        for(int i = 0; i < tosize; i++){
            cout << array[i] << " ";
        }
        for(int i = tosize; i < cap; i++){
            cout << "? ";
        }
        cout << endl;
    }
};