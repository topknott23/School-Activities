#include <iostream>
#include "rectangle.hpp"

using namespace std;

int main() {
    Rectangle rect;
    cout << "Enter x of rectangle point 1: ";
    cin >> rect.p1.x;
    // TODO store the x-coord of rectangle's first point here.
    cout << "Enter y of rectangle point 1: ";
    cin >> rect.p1.y;
    // TODO store the y-coord of rectangle's first point here.
    cout << "Enter x of rectangle point 2: ";
    cin >> rect.p2.x;
    // TODO store the x-coord of rectangle's second point here.
    cout << "Enter y of rectangle point 2: ";
    cin >> rect.p2.y;
    // TODO store the y-coord of rectangle's second point here.

    cout << endl << "Perimeter of the rectangle: " << rect.perimeter();
    cout << endl << "Area of the rectangle: " << rect.area() << endl;
    return 0;
}