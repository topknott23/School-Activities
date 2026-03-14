#include <cstdlib>
#include <iostream>
#include <cmath>
#include "hashtable.hpp"
#include "linkedlist.hpp"
using namespace std;

class HTSepChain : public HashTable {
    // IMPLEMENT ME
    private:
    LinkedList* table;
    int N;
    
    public:
    HTSepChain(int capacity) : N(capacity){
        table = new LinkedList[N];
    }
    
    int hash_code(string key){
        long h = 0;
        int a = 5;
        for(int i = 0; i < key.length(); i++){
            h = (h * a) + (int)key[i];
        }
        return (int)h;
    }
    
    
    int compress(int code){
        int index = code % N;
        if(index < 0) index += N;
        return index;
    }
    
    
    int insert(string key){
        int index = this->hashfn(key);
        if(table[index].contains(key)){
            throw runtime_error("Already added key " + key);
        }
        table[index].insert(key);
        return table[index].getSize();
    }
    
    
    int search(string key){
        int index = this->hashfn(key);
        if(table[index].contains(key)){
            return table[index].getSize();
        }
        return -1;
    }
    
    
    int remove(string key){
        int index = this->hashfn(key);
        if(table[index].remove(key)){
            return table[index].getSize();
        }
        return -1;
    }
    
  
    void print(){
        for(int i = 0; i < N; i++){
            cout << i;
            table[i].print();
            cout<<endl;
        }
        cout << endl;
    }
    
};