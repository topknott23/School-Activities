#include "entry.hpp"
class Scoreboard {
	entry board[5];
	int size;

	public:
	// TODO change this
	bool add(entry e) {
	    for(int i = 0; i < size; i++){
	        entry* exist = &board[i];
	        if(e.score > exist->score){
	            for(int j = size; j >= i+1; j--){
	                if(j == 5){
	                    continue;
	                }
	                board[j] = board[j-1];
	            }
	            board[i] = e;
	            if(size < 5) {
	                size++;
	            }
	            return true;
	        }
	    }
	    if(size < 5){
	        board[size++] = e;
	        return true;
	        
	    }else{
	        return false;
	    }
// 		if (size >= 5) {
// 			return false;
// 		}
// 		board[size++] = e;
		
		
// 		for(int i = 0; i < size; i++){
// 		    for(int j = i; j < size; j++){
// 		        if(board[i].score < board[j].score){
// 		            int a = board[i].score;
// 		            board[i].score = board[j].score;
// 		            board[j].score = a;
		            
// 		            string b = board[i].name;
// 		            board[i].name = board[j].name;
// 		            board[j].name = b;
		            
// 		            string c = board[i].college;
// 		            board[i].college = board[j].college;
// 		            board[j].college = c;
// 		        }
// 		    }
// 		}
// 		return true;
    }

    void print() {
        for (int i = 0; i < 5; i++) {
            if (i >= size) {
                cout << i+1 << ". (none)" << endl;
            } else {
            	entry e = board[i];
                cout << i+1 << ". " << e.name << " (" << e.college << ")" << " - " << e.score << endl;
            }
        }
        cout << endl;
    }
};