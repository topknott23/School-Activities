#include <iostream>
#include "board.hpp"
using namespace std;

int main() {
	entry player1;
	Scoreboard* board = new Scoreboard();
    char op;
    bool res;
    int score;
	do {
		cout << "Op: ";
		cin >> op;
        switch (op) {
            case 'a':
        		cout << "Enter name: ";
                cin.ignore();
        		getline(cin, player1.name);
        		cout << "Enter college: ";
        		cin >> player1.college;
        		cout << "Enter score: ";
        		cin >> player1.score;
        		res = board->add(player1);
        		if (res) {
        		    cout << player1.name << " added" << endl;
        		} else {
        		    cout << player1.name << " not added" << endl;
         		}
                break;
            case 'p':
                board->print();
                break;
            case 'x':
                cout << "Exiting";
                break;
            default:
                cout << "Invalid operation" << endl;
        }
	} while (op != 'x');

	return 0;
}