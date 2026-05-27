#include "node.hpp"
#include <iostream>
#include <climits>
#include <utility>

using namespace std;
class Heap {
    private:
    node* arr[100];
    int heapSize = 0;
    
    void bubbleUp(int index){
        while(index > 0){
            int parent = (index - 1) / 2;
            if(arr[index]->weight < arr[parent]->weight){
                swap(arr[index], arr[parent]);
                index = parent;
            }else{
                break;
            }
        }
    }
    
    void bubbleDown(int index){
        while(true){
            int left = 2 * index + 1;
            int right = 2 * index + 2;
            int smallest = index;
            
            if(left < heapSize && right < heapSize){
                if(arr[left]->weight < arr[index]->weight || arr[right]->weight < arr[index]->weight){
                    if(arr[left]->weight == arr[right]->weight){
                        smallest = left;
                    }else if(arr[left]->weight < arr[right]->weight){
                        smallest = left;
                    }else{
                        smallest = right;
                    }
                }
            }
            else if(left < heapSize && arr[left]->weight < arr[index]->weight){
                smallest = left;    
            }
        if(smallest != index){
            swap(arr[index], arr[smallest]);
            index = smallest;
        }else{
            break;
        }
        }
    }
	public:
    // TODO insert
	void insert(node* n) {
        arr[heapSize] = n;
        bubbleUp(heapSize);
        heapSize++;
	}

    // TODO removeMin
	node* removeMin() {
		if(heapSize == 0) return nullptr;
		
		node* min = arr[0];
		arr[0] = arr[heapSize - 1];
		heapSize--;
		
		if(heapSize > 0){
		    bubbleDown(0);
		}
		return min;
		
	}

    // TODO size
	int size() {
		return heapSize;
	}
};