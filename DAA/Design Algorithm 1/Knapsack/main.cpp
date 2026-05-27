#include <iostream>
#include <algorithm>
using namespace std;

int knapsack(int cap, int* val, int* weights, int num){
    int res[num + 1][cap + 1];
    
    for(int i = 0; i <= num; i++){
        for(int j = 0; j <= cap; j++){
            
            if(i == 0 || j == 0)
                res[i][j] = 0;
            else{
                int c = 0;
            
            if(weights[i - 1] <= j) c = val[i - 1] + res[i-1][j-weights[i - 1]];
            
            int n = res[i-1][j];
            res[i][j] = max(c, n);
        }
    }
}
return res[num][cap];
}

int main(){
        int cap;
        int num;
        cout<<"Enter number of items and weight capacity: ";
        cin >> num >> cap;
        cout<<"Enter value and weight of each item: \n";
        int* val = new int[num];
        int* weights = new int[num];
        
        for(int i = 0; i < num; i++){
            cin >> val[i] >> weights[i];
        }
        
        cout << "Maximum value in Knapsack = "<< knapsack(cap,val,weights,num);
}