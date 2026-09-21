#ifndef NODE_HPP
#define NODE_HPP
#include <algorithm>

struct node {
    node **children;
    node *parent;
    int num_child;
    int elem;

    int depth() {
        if (parent == nullptr)
            return 0;
        return 1 + parent->depth();
    }

    int height() {
        if (num_child == 0)
            return 0;
        int max_h = 0;
        for (int i = 0; i < num_child; i++) {
            max_h = std::max(max_h, children[i]->height());
        }
        return 1 + max_h;
    }
};

#endif