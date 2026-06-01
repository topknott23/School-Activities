// TODO create struct Rectangle here, with the methods area() and perimeter()
#include "point.hpp"
#include <math.h>


struct Rectangle{
    Point p1, p2;
    
    int perimeter(){
        int a = fabs(p1.x - p2.x) * 2;
    int b = fabs(p1.y - p2.y) * 2;
    return a+b;
    }
    
    int area(){

    int a = fabs(p1.x - p2.x);
    int b = fabs(p1.y - p2.y);
    return   a * b;  
    }
};