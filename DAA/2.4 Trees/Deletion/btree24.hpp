#include "node.hpp"
#include <iostream>
using namespace std;

class BTree24 {
	public:
	node* root;
	
	void handle_underflow(node* w){
	    
	
	    //Base case katong if underflow
	    if(w == root){
	        if(w->size ==0){
	            if(w->children[0] != nullptr){
	                root = w->children[0];
	                root->parent = nullptr;
	            }else{
	                root = nullptr;
	            }
	        }
	        return;
	    }
	    if(w->size >= 1) return; // walay underflow
	    
	    node* p = w->parent;
	    int cidx = 0;
	    while(cidx <= p->size && p->children[cidx] != w){
	        cidx++;
	    }
	    
	    node* left_sib = (cidx > 0) ? p->children[cidx - 1] : nullptr;
	    node* right_sib = (cidx < p->size) ? p->children[cidx + 1] : nullptr;
	    
	    node* transfer_sib = nullptr;
	    bool from_right = false;
	    
	    //transfer(borrowing)
	    
	    if(left_sib && left_sib->size > 1 && right_sib && right_sib->size > 1){
	        if(right_sib->size > left_sib->size){
	            transfer_sib = right_sib; from_right = true;
	        }else if(left_sib->size > right_sib->size) {
	            transfer_sib = left_sib; from_right = false;
	        }else{
	            transfer_sib = right_sib; from_right = true;
	        }
	    }else if(right_sib && right_sib->size > 1){
	        transfer_sib = right_sib; from_right = true;
	    }else if(left_sib && left_sib->size > 1){
	        transfer_sib = left_sib; from_right = false;
	    }
	    if(transfer_sib != nullptr){
	        if(from_right){
	            w->keys[0] = p->keys[cidx];
	            w->children[1] = right_sib->children[0];
	            if(w->children[1]) w->children[1]->parent = w;
	            w->size = 1;
	            
	            p->keys[cidx] = right_sib->keys[0];
	            
	            for(int i = 0; i < right_sib->size - 1; i++){
	                right_sib->keys[i] = right_sib->keys[i + 1];
	            }
	            for(int i = 0; i < right_sib->size; i++){
	                right_sib->children[i] = right_sib->children[i + 1];
	               // right_sib->keys[i + 1];
	            }
	            right_sib->size--;
	            
	        }else{
	            w->keys[0] = p->keys[cidx - 1];
	            w->children[1] = w->children[0];
	            w->children[0] = left_sib->children[left_sib->size];
	            if(w->children[0]) w->children[0]->parent = w;
	            w->size = 1;
	            
	            p->keys[cidx - 1] = left_sib->keys[left_sib->size - 1];
	            left_sib->size--;
	        }
	    }else{
	        if(right_sib != nullptr){
	            w->keys[0] = p->keys[cidx];
	            w->keys[1] = right_sib->keys[0];
	            w->children[1] = right_sib->children[0];
	            w->children[2] = right_sib->children[1];
	            if(w->children[1]) w->children[1]->parent = w;
	            if(w->children[2]) w->children[2]->parent = w;
	            w->size = 2;
	            
	            for(int i = cidx; i < p->size - 1; i++){
	                p->keys[i] = p->keys[i + 1];
	            }
	            for(int i = cidx + 1; i < p->size; i++){
	                p->children[i] = p->children[i + 1];
	            }
	            p->size--;
	        }else{
	            left_sib->keys[1] = p->keys[cidx - 1];;
	            left_sib->children[2] = w->children[0];
	            if(left_sib->children[2]) left_sib->children[2]->parent = left_sib;
	            left_sib->size = 2;
	           // for(int i = cidx; i < p->size; i++){
	           //     p->keys[i] = p->keys[i + 1];
	           // }
	            for(int i = cidx - 1; i < p->size - 1; i++){
	                p->keys[i] = p->keys[i + 1];
	                
	            }for(int i = cidx; i < p->size; i++){
	                p->children[i] = p->children[i + 1];
	            }
	            p->size--;
	        }
	        if(p->size == 0){
	            handle_underflow(p);
	        }
	    }
	}

	BTree24() {
		root = nullptr;
	}

	virtual bool insert(int num) = 0;
	virtual node* search(int, node*) = 0;
	virtual void print() = 0;

    //TODO remove
	bool remove(int num) {
		node* curr = root;
		int idx = -1;
		
		while(curr != nullptr){
		    idx = -1;
		    for(int i = 0; i < curr->size; i++){
		        if(curr->keys[i] == num){
		            idx = i;
		            break;
		        }
		    }
		    if(idx != -1) break;
		    
		    int i = 0;
		    while(i < curr->size && num > curr->keys[i]){
		        i++;
		    }
		    curr = curr->children[i];
		}
		
		if(curr == nullptr) return false;
		
		if(curr->children[0] != nullptr){
		    node* succ = curr->children[idx + 1];
		    while(succ->children[0] != nullptr){
		        succ = succ->children[0];
		    }
		    curr->keys[idx] = succ->keys[0];
		    curr = succ;
		    idx = 0;
		}
		    for(int i = idx; i < curr->size - 1; i++){
		        curr->keys[i] = curr->keys[i + 1];
		    }
		    curr->size--;
		    
		    if(curr->size == 0){
		        handle_underflow(curr);
		    }
            return true;
	}
};