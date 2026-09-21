#include <string>
using namespace std;

struct node {
    string elem;
    node* left;
    node* right;
    node* parent;

    int evaluate() {

        if (!(elem == "+" || elem == "-" || elem == "*" || elem == "/"))
            return stoi(elem);

        
        int lval = left->evaluate();
        int rval = right->evaluate();

        if (elem == "+") return lval + rval;
        if (elem == "-") return lval - rval;
        if (elem == "*") return lval * rval;
        if (elem == "/") return lval / rval;

        return 0;
    }
};