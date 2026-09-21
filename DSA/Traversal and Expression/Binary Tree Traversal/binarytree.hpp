#include "node.hpp"
#include "arrayqueue.hpp"
#include <iostream>
using namespace std;

class BinaryTree {
public:
	virtual node* left(node*) = 0;
	virtual node* right(node*) = 0;
	virtual node* addRoot(int e) = 0;
	virtual node* addLeft(node* p, int e) = 0;
	virtual node* addRight(node* p, int e) = 0;
	virtual node* getRoot() = 0;
	virtual void print() = 0;

	void preorder() { preorder(getRoot()); }
	void inorder() { inorder(getRoot()); }
	void postorder() { postorder(getRoot()); }
	void breadthfirst() {
		node* root = getRoot();
		if (!root) return;
		Queue* queue = new ArrayQueue();
		queue->enqueue(root);
		while (!queue->isEmpty()) {
			node* current = queue->dequeue();
			cout << current->elem << " ";
			if (left(current)) queue->enqueue(left(current));
			if (right(current)) queue->enqueue(right(current));
		}
		delete queue;
	}

private:
	void preorder(node* n) {
		if (!n) return;
		cout << n->elem << " ";
		preorder(left(n));
		preorder(right(n));
	}

	void inorder(node* n) {
		if (!n) return;
		inorder(left(n));
		cout << n->elem << " ";
		inorder(right(n));
	}

	void postorder(node* n) {
		if (!n) return;
		postorder(left(n));
		postorder(right(n));
		cout << n->elem << " ";
	}
};