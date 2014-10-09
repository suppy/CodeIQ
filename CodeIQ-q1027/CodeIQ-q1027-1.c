#include <stdio.h>

int main(void) {
	int i,j,p;
	for(i=2;i<997;i++){
		p = 1;
		for(j=2;j<i;j++){
			if(i%j == 0){
				p = 0;
				break;
			}
		}
		if(p==1){
			printf("%d:",i);
		}
		
	}
	printf("997");
	return 0;
}