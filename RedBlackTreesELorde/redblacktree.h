#include <iostream>
#include "node.h"
using namespace std;

class Tree {
    public:
    int size;
    node* root;

    Tree() {
        size = 0;
        root = nullptr;
    }

    node* create_node(int num, node* parent) {
        node* n = (node*)malloc(sizeof(node));
        n->elem = num;
        n->is_red = true;
        n->parent = parent;
        size++;
        return n;
    }

    


}