#include <stdio.h>


#define SIZE 314159
/*
#define SIZE 9
*/
int cross = 0,cross1 = 0;

void quickSort(int *arr, int left, int right)
{
	int p, l, r, tmp;

	if(left <= right){
		p = arr[(left + right) / 2];
		l = left;
		r = right;
		while(l <= r){
			while(arr[l] < p)
				l++;
			while(arr[r] > p)
				r--;
			if(l <= r){
				tmp = arr[l];
				arr[l] = arr[r];
				arr[r] = tmp;
				l++;
				r--;
				if(cross + 1 < 0){
					cross1++;
					cross = -1;
				}
				cross += 1;
			}
		}
		quickSort(arr, left, r);
		quickSort(arr, l, right);
	}
}
		

int main()
{

	FILE *fp;
	int i,j;
	int a[SIZE];
	fp = fopen("crossing-q432.txt", "r");
	for(i = 0;i < SIZE;i++){
		fscanf(fp, "%d", &a[i]);
	}
	fclose(fp);

	quickSort(a, 0, SIZE - 1);

	for(i = SIZE - 15;i < SIZE;i++){
		printf("a[%2d] = %2d\n", i, a[i]);
	}

	printf("cross:%d\n", cross);
	printf("cross1:%d\n", cross1);
	printf("sizeof(int)=%d", sizeof(int));
	return 0;

}

