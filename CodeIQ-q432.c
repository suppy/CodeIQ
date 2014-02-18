#include <stdio.h>

#define SIZE 314159

int main()
{

	FILE *fp;
	int i,j;
	int cross = 0,cross1 = 0, tmp;
	int a[SIZE];
	fp = fopen("crossing-q432.txt", "r");
	for(i = 0;i < SIZE;i++){
		fscanf(fp, "%d", &a[i]);
	}
	fclose(fp);


	for(i = 0;i < SIZE - 1;i++){
		j = i;
		while( a[j] > a[j + 1]){
			tmp = a[j];
			a[j] = a[j + 1];
			a[j + 1] = tmp;
			if(cross + 1 < 0){
				cross1++;
				cross = -1;
			}
			cross += 1;
			j -= 1;
			if(j < 0){
				break;
			}
		}
		if(i % 10000 == 0){
			printf("%d\n", i);
		}
	}
/*
	for(i = 0;i < SIZE;i++){
		printf("a[%2d] = %2d\n", i, a[i]);
	}
*/
	printf("cross:%d\n", cross);
	printf("cross1:%d\n", cross1);
	printf("sizeof(int)=%d", sizeof(int));
	return 0;

}

