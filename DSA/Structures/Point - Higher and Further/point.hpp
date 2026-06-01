#include <math.h>

struct Point {
    int x;
    int y;

    // TODO create methods here
    Point* higher(Point* other){
        // if(other-> x > x){
        //     return other;
        // }
        Point* a = new Point;
        if(y > other->y){
            a->y = y;
            a->x = x;
            
            }else{
                a = other;
            }
            return a;
    }
    
    Point* further(Point* other){
        // if(other-> y > y){
        //     return other;
        // }
        Point* a = new Point;
        int p1 = abs(x);
        int p2 = abs(other->x);
        if(p1 > p2){
            a -> x = x;
            a -> y = y;
            
        }else{
            a = other;
        }
        return a;
    }
    

};

typedef Point point;