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

    cout << endl << "The slope of the line connected by the two points is " << point1.slope(&point2) << endl;
    cout << "The distance of the line between the two points is " << point1.distance(&point2) << endl;
    return 0;
}