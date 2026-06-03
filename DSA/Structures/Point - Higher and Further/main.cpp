#include <iostream>
#include "point.hpp"
using namespace std;

int main() {
    Point point1, point2;
    cout << "Enter x of point 1: ";
    cin >> point1.x;
    cout << "Enter y of point 1: ";
    cin >> point1.y;
    cout << "Enter x of point 2: ";
    cin >> point2.x;
    cout << "Enter y of point 2: ";
    cin >> point2.y;

    cout << "Higher or Further? ";
    char op;
    cin >> op;
    if (op == 'h') {
        Point* res = point1.higher(&point2);
        cout << "(" << res->x << ", " << res->y << ") is higher.";
    } else {
        Point* res = point1.further(&point2);
        cout << "(" << res->x << ", " << res->y << ") is further.";
    }
    return 0;
}