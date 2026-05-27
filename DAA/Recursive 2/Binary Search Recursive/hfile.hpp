// TODO helper

int helper(int arr[], int low, int high, int x){
    if(low > high) return -1;
    
    int mid = low + (high - low) / 2;
    
    if(arr[mid] == x){
        return mid;
    }
    
    if(arr[mid] > x){
        return helper(arr, low, mid - 1, x);
    }else{
        return helper(arr, mid + 1, high, x);
    }
}