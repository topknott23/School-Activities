#include <cstdlib>
#include <iostream>
#include <string>
#include <stdexcept>
#include "hashtable.hpp"
using namespace std;

template <typename K>
class HTLinear : public HashTable<K> {
    private:
    K* table;
    int N;
    int count;
    const int EMPTY = -1;
    const int DELETED = -2;
    
    public:
    HTLinear(int capacity) : N(capacity){
         count = 0;
        table = new K[N];
        for(int i = 0; i < N; i++){
            table[i] = EMPTY;
        }
    }
    
    int hash_code(K key){
        return (int)key;
    }
    int compress(int code){
        return ((59 * code + 17) % 509) % N;
    }
    int insert(K key){
        if(count == N){
            throw runtime_error("Table already full");
        }
        int home = this->hashfn(key);
        int collisions = 0;
        
        while(collisions < N){
            int index = (home + collisions) % N;
            
            if(table[index] == (K)key){
                throw runtime_error("Already added key " + to_string(key));
            }
            if(table[index] == EMPTY || table[index] == DELETED){
                table[index] = key;
                count++;
                return collisions;
            }
            collisions++;
        }
        throw runtime_error("Table already full");
    }
    
    int search(K key){
        int home = this->hashfn(key);
        int cellsChecked = 0;
        
        while(cellsChecked < N){
            int index = (home + cellsChecked) % N;
            
            if(table[index] == EMPTY){
                
                return -1;
            }
            if(table[index] == (K)key){
             
                return cellsChecked;
            }
            cellsChecked++;
        }
        return -1;
    }
    
 
    int remove(K key){
         int home = this->hashfn(key);
        int cellsChecked = 0;
        
        while(cellsChecked < N){
            int index = (home + cellsChecked) % N;
            
            if(table[index] == EMPTY){
                
                return -1;
            }
            
            if(table[index] == (K)key){
                 table[index] = DELETED;
                count--;
                return cellsChecked;
            }
           cellsChecked++;
        }
        return -1;
    }
    
    void print(){
        for(int i = 0; i < N; i++){
            cout<< i << (i == N - 1 ? "" : "\t");
        }
        cout << endl;
        
        for(int i = 0; i < N; i++){
            if(table[i] == EMPTY || table[i] == DELETED){
                cout << 0;
            }else{
                cout << table[i];
            }
            cout << (i == N - 1 ? "" : "\t");
        }
        cout << endl;
    }
};