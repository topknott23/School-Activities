#include <iostream>
#include <string>
using namespace std;

struct node {
	char ch;
	int weight;
	node *left, *right, *parent;

	node(char c, int w) : ch(c), weight(w), left(nullptr), right(nullptr), parent(nullptr) {};

	// TODO getCode
	string getCode() {
	     string code = "";
	    node* current = this;
	    
	    while(current->parent != nullptr){
	        if(current->parent->left == current){
	            code = "0" + code;
	        }else{
	            code = "1" + code;
	        }
	        current = current->parent;
	    }
	    return code;
	}
};