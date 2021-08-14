#include <stdio.h>

int function(int x){
	return x;
}
int main(void){
	int y = function(0x06) + 0x01;

	printf("%d", y);

	return 0x08;
}
