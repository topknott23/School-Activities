#include <cmath>

struct Point {
    int x;
    int y;

    // TODO create slope and distance methods here
    double distance(Point* other){
        double a = pow((other->x - x), 2);
        double b = pow((other->y - y), 2);
        double sum = a + b;
        return sqrt(sum);
        // return sqrt(pow(other->x - x,2)) + pow(other->y - y,2);
    }
    
    double slope(Point* other){
        double a = (other->y - y);
        double b = (other->x - x);
        double res = a / b;
        return res;
    }
};

typedef Point point;