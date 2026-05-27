#include "heap.hpp"

// TODO huffman
node* huffman_code(Heap* heap) {
    while(heap->size() > 1){
        node* left = heap->removeMin();
        node* right = heap->removeMin();
        
        node* parent = new node('\0', left->weight + right->weight);
        
        parent->left = left;
        parent->right = right;
        
        left->parent = parent;
        right->parent = parent;
        
        heap->insert(parent);
    }
    
    if(heap->size() == 1){
        return heap->removeMin();
    }
    return nullptr;
}