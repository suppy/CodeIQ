#include <stdio.h>

int main(void) {
	int i,j;
	int n = 5;
	for(n=5;n<=7;n++){	
		for(i=1;i<=n;i++){
			for(j=1;j<=i;j++){
				printf("*");
			}
			for(j=n-i;j>0;j--){
				printf(" ");
			}
			for(j=n-i+1;j>0;j--){
				printf("*");
			}
			printf("\n");
		}
		for(i=1;i<=n;i++){
			for(j=n-i;j>0;j--){
				printf(" ");
			}
			for(j=1;j<=i;j++){
				printf("*");
			}
			for(j=1;j<i;j++){
				printf(" ");
			}
			for(j=n-i+1;j>0;j--){
				printf("*");
			}
			printf("\n");
		}
	}
	return 0;
}
