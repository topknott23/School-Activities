#ifndef MYGENTREE_HPP
#define MYGENTREE_HPP

#include <iostream>
#include "node.hpp"
#include "gentree.hpp"
using namespace std;

class MyGenTree : public GenTree {
private:
    node* root;
    int size;

public:
    MyGenTree() {
        root = nullptr;
        size = 0;
    }

    node* getRoot() override {
        return root;
    }

    int getSize() override {
        return size;
    }

    node* addRoot(int val) override {
        if (root != nullptr) {
            cout << "Already has root" << endl;
            return nullptr;
        }
        root = new node;
        root->elem = val;
        root->parent = nullptr;
        root->num_child = 0;
        root->children = new node*[10];
        for (int i = 0; i < 10; i++)
            root->children[i] = nullptr;

        size++;
        return root;
    }

    node* addChild(node* parent, int val) override {
        if (parent == nullptr) {
            
            return nullptr;
        }

        if (parent->num_child >= 10) {
            
            return nullptr;
        }

        node* child = new node;
        child->elem = val;
        child->parent = parent;
        child->num_child = 0;
        child->children = new node*[10];
        for (int i = 0; i < 10; i++)
            child->children[i] = nullptr;

        parent->children[parent->num_child++] = child;
        size++;
        return child;
    }

    void remove(node* n) override {
        if (n == nullptr)
            return;

        if (n->num_child > 0) {
            cout<< n->elem << " has children" << endl;
            return;
        }

        if (n == root) {
            delete[] n->children;
            delete n;
            root = nullptr;
            size = 0;
            return;
        }

        node* p = n->parent;
        for (int i = 0; i < p->num_child; i++) {
            if (p->children[i] == n) {
                for (int j = i; j < p->num_child - 1; j++) {
                    p->children[j] = p->children[j + 1];
                }
               
                p->num_child--;
                break;
            }
        }

        delete[] n->children;
        delete n;
        size--;
    }
};

#endif