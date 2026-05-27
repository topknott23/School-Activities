#include <iostream>
#include "linkedlist.h"
#include <bits/stdc++.h>

LinkedList* mergeSort(LinkedList*);

// WARNING! Do not modify this main function!
// Doing so will nullify your score for this activity.
int main(void) {
    LinkedList* list = new LinkedList();

    int length;
    cout << "Input length: ";
    cin >> length;

    int input;
    for (int i = 0; i < length; i++) {
        cout << "Enter element " << i + 1 << ": ";
      cin >> input;
      list->add(input);
    }
    list->print();

    list = mergeSort(list);
    return 0;
};

LinkedList* mergeSort(LinkedList* list) {
    // BASE CASE: When the list only contains one element.
    if (list->size() <= 1) {
        return list;
    }

    // Step 1 - DIVIDE
    LinkedList* firsthalf = new LinkedList();
    LinkedList* secondhalf = new LinkedList();
    // TODO: ...
    
    int sizee = list->size();
    int index = 1;
    int i = 0;
   
    
    for(; i < (sizee / 2); i++){
        int a = list->get(index);
        firsthalf->add(a);
        index++;
    }
    
    
    if(sizee % 2 != 0){
        firsthalf->add(list->get(index));
        index++;
        i++;
    }
    
    for(; i < sizee; i++){
        secondhalf->add(list->get(index));
        index++;
    }


    // Given: Step 2 - RECURSIVE CALL
    cout << "My first list: ";
    firsthalf->print();
    firsthalf = mergeSort(firsthalf);

    cout << "My second list: ";
    secondhalf->print();
    secondhalf = mergeSort(secondhalf);

    int sizel = firsthalf->size();
    int sizer = secondhalf->size();
    
    i = 1;
    int j = 1;
    // Step 3 - COMBINE
    LinkedList* sorted = new LinkedList();
    // TODO: ...
    while(i <= sizel && j <= sizer){
        int num1 = firsthalf->get(i);
        int num2 = secondhalf->get(j);
        
        if(num1 < num2){
            sorted->add(num1);
            i++;
        }else{
            sorted->add(num2);
            j++;
        }
    }
    while(i <= sizel){
        sorted->add(firsthalf->get(i));
        i++;
    }
    while(j<=sizer){
        sorted->add(secondhalf->get(j));
        j++;
    }

    // print and return the sorted list
    cout << "SORTED: ";
    sorted->print();
    return sorted;
}