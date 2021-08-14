#include <stdio.h>

int function(int x, int y){
        return x + y;
}
int main(void){
        int y = function(0x06, 0x01) + 0x01;

        printf("%d", y);

        return 0x08;
}
