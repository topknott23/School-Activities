#include <iostream>
#include <string>
#include "arraystack.hpp"
using namespace std;

int is_balanced_parentheses(string str) {
    Stack* stack = new ArrayStack();

    for (char c : str) {
        if(c == '(' || c == '[' || c == '{'){
            stack->push(c);
        }
        else if(c == ')' || c == ']' || c == '}'){
            if(stack->isEmpty()){
                return 3;
            }
            char top = stack->top();
            
            if((c == ')' && top != '(') || (c == ']' && top != '[') || (c == '}' && top != '{')){
                return 1;
            }
            
            stack->pop();
        }
    }
    if (stack->isEmpty()) {
        return 0; 
    } else {
        return 2; // Missing closing parenthesis
    }
}



int main(){
    string str;
    cout << "Enter a string with parentheses: ";
    cin >> str;
    int res = is_balanced_parentheses(str);
    switch(res) {
        case 0:
            cout << "The parentheses are balanced!" << endl;
            break;
        case 1:
            cout << "The parentheses are not balanced due to mismatch!" << endl;
            break;
        case 2:
            cout << "The parentheses are not balanced due to missing closing parentheses!" << endl;
            break;
        case 3:
            cout << "The parentheses are not balanced due to missing opening parentheses!" << endl;
            break;
    }
    return 0;
}