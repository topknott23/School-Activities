#include "node.hpp"
#include <iostream>
using namespace std;

class BTree24 {
	node* root;
	
		void split(node* w){
		    
	    int k3 = w->keys[2];
	    node* wrhs = new node;
	    wrhs->children = new node*[5];
	    for(int j = 0; j < 5; j++) wrhs->children[j] = nullptr;
	    wrhs->keys[0] = w->keys[3];
	    wrhs->size = 1;
	    wrhs->parent = w->parent;
	    
	    wrhs->keys[0] = w->keys[3];
	    wrhs->size = 1;
	    wrhs->parent = w->parent;
	    wrhs->children[0] = w->children[3];
	    wrhs->children[1] = w->children[4];
	    if(w->children[3]) w->children[3]->parent = wrhs;
	    if(w->children[4]) w->children[4]->parent = wrhs;
	    
	    w->size = 2;
	    w->children[3] = nullptr;
	    w->children[4] = nullptr;
	    
	    if(w == root){
	        node* new_root = new node;
	        new_root->children = new node*[5];
	        for(int j = 0; j < 5; j++) new_root->children[j] = nullptr;
	        new_root->keys[0] = k3;
	        new_root->size = 1;
	        new_root->children[0] = w;
	        new_root->children[1] = wrhs;
	         w->parent = new_root;
	         wrhs->parent = new_root;
	         root = new_root;
	    }else{
	        node* p = w->parent;
	        int i = p->size - 1;
	        while(i >= 0 && p->keys[i] > k3){
	            p->keys[i + 1] = p->keys[i];
	            p->children[i + 2] = p->children[i + 1];
	            i--;
	        }
	       	 p->keys[i + 1] = k3;
	         p->children[i + 2] = wrhs;
	         p->size++;
	           
	         if(p->size == 4){
	          split(p);
             }	
	    }
	    }
	public:
	BTree24() {
		root = nullptr;
	}
	bool insert(int num) {
	    if(root == nullptr){
	        root = new node;
	        root->children = new node*[5];
	        for(int j = 0; j < 5; j++) root->children[j] = nullptr;
	        root->keys[0] = num;
	        root->size = 1;
	        root->parent = nullptr;
	        return true;
	    }
	    
	    node* curr = root;
	    while(curr && curr->children[0] != nullptr){
	        int i = 0;
	        while(i < curr->size && num > curr->keys[i]){
	            i++;
	        }
	        
	        if(i < curr->size && num == curr->keys[i]){
	            return false;
	        }
	        curr = curr->children[i];
	    } 
	    if(!curr) return false;
	    
	    for(int j = 0; j < curr->size; j++){
	        if(curr->keys[j] == num) return false;
	    }
	    
	    int i = curr->size - 1;
	    while(i >= 0 && curr->keys[i] > num){
	        curr->keys[i + 1] = curr->keys[i];
	        i--;
	    } 
	    curr->keys[i + 1] = num;
	    curr->size++;
	    
	    if(curr->size == 4){
	        split(curr);
	    }
	    return true;
	}

	// WARNING. Do not modify these methods.
    // Doing so will nullify your score for this activity.
	void print_node(string s, node* n) {
		cout << s << ": ";
		for (int i = 0; i < n->size; i++) {
			cout << n->keys[i] << " ";
		}
		cout << endl;
		for (int i = 0; i <= n->size; i++) {
			if (n->children[i]) {
				print_node("Child " + to_string(i+1) + " of " + s,n->children[i]);
			}
		}
	}
    bool check_parent(node* curr, node* par) {
        if (!curr) {
            return true;
        }
        if (curr->parent != par) {
            if (!curr->parent) {
                cout << "Illegal parent of [" << curr->keys[0] << ",...]: NULL -- must be [" << par->keys[0] << ",...]" << endl;
            } else if (!par) {
                cout << "Illegal parent of [" << curr->keys[0] << ",...]: [" << curr->parent->keys[0] << ",...] -- must be NULL" << endl;
            } else {
                cout << "Illegal parent of [" << curr->keys[0] << ",...]: [" << curr->parent->keys[0] << ",...] -- must be [" << par->keys[0] << ",...]" << endl;
            }
            return false;
        }
        bool res = true;
        for (int i = 0; i < curr->size; i++) {
        	res &= check_parent(curr->children[i], curr);
		}
        return res;
    }

	void print() {
		print_node("Root", root);
		check_parent(root, NULL);
	}
};