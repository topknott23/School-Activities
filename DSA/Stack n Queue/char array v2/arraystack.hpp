// TODO implement the stack using the operations of Array List
#include <iostream>
#include <cmath>
#include "stack.hpp"
using namespace std;

class ArrayStack : public Stack {
    private:
    char* arr;
    int cap;
    int count;
    

  void resize(int newCap){
        if(newCap< 5) newCap = 5;
        char* newArr = new char[newCap];
        for(int i = 0; i < count; i++){
            newArr[i] = arr[i];
        }
        delete[] arr;
        arr = newArr;
        cap = newCap;
    }

public :
    
    ArrayStack(){
        cap = 5;
        count = 0;
        arr = new char[cap];
    }
    
    void push(char c){
        if(count >= cap){
            int newCap = ceil(cap * 1.5);
            resize(newCap);
        }
        arr[count++] = c;
    }
    
    char pop(){
        if(count == 0) return ' ';
        if(cap >= (count * 0.6)){
            int newCap = ceil(cap * 0.8);
            resize(newCap);
        }
        
        return arr[--count];
    }
    
    
    char top(){
        if(count == 0) return ' ';
        return arr[count - 1];
        
    }
    
    int size(){
        return count;
    }    

    bool isEmpty(){
        return count == 0;
    }


};

// class ArrayStack : public Stack {
//     private: 
//     char* arr;
//     int cap;
//     int count;
    
//     void resize(int newCap){
//         if(newCap< 5) newCap = 5;
//         char* newArr = new char[newCap];
//         for(int i = 0; i < count; i++){
//             newArr[i] = arr[i];
//         }
//         delete[] arr;
//         arr = newArr;
//         cap = newCap;
//     }
    
//     public:
//         ArrayStack(){
//             cap = 5;
//             count = 0;
//             arr = new char[cap];
//         }
        
//     void push(char c){
//         if(count == cap){
//             int newCap = ceil(cap * 1.5);
//             resize(newCap);
//         }
//         arr[count++] = c;
        
        
//     }
    
//     char pop(){
//         if(count == 0) return ' ';
       
//         if(count <= cap * 0.6 ){
//             int newCap = floor(cap * 0.8);
          
//             resize(newCap);
//         }
//         return arr[--count];
//     }
    
//     char top(){
//         if(count == 0) return ' ';
//         return arr[count - 1];
//     }
    
//     int size() {
//         return count;
//     }
//     bool isEmpty(){
//         return count == 0;
//     }

// };