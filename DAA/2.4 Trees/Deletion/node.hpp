#pragma once
struct node {
	node* parent;
	int keys[4];
	node** children;
	int size = 0;
	
	void insertKeyAt(int key, int index){
	    for(int i = 3; i > index; i--){
	        keys[i] = keys[i - 1];
	    }
	    keys[index] = key;
	    size++;
	}
	
	bool contains(int num){
	    for(int i = 0; i < size; i++){
	        if(keys[i] == num){
	            return true;
	        }
	    }
	    return false;
	}
};