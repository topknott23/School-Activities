#include <iostream>
using namespace std;

struct node {
    int elem;
    node* left, *right, *parent;
    bool is_red;
};