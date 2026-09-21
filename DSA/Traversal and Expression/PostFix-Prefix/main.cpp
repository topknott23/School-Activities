#include <iostream>
#include <string>
#include "arraystack.hpp" 
using namespace std;

int main() {
    Stack* stack = new ArrayStack();
    string input;



    while (true) {
        cout << "Enter: ";
        cin >> input;

        if (input == "x") break; 


        if (input == "+" || input == "-" || input == "*" || input == "/") {
            if (stack->size() < 2) {
                cout << "Error: not enough operands." << endl;
                return 1;
            }

            string b = stack->pop();
            string a = stack->pop();

            string result = input + " " + a + " " + b;
            stack->push(result);
        }
        else {
          
            stack->push(input);
        }
    }

    if (!stack->isEmpty()) {
        cout << "Prefix: " << stack->pop() << endl;
    } else {
        cout << "Error: empty stack." << endl;
    }

    delete stack;
    return 0;
}