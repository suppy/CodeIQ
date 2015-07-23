#include <stdio.h>

int main(void) {
	int i, j, k, n;
	int l, sub_l, bar[5001], exist[1000000][2] = {0};
	int count;
	
	scanf("%d", &l);
	scanf("%d", &n);
	for(i = 0;i < n;i++){
		scanf("%d", &bar[i]);
		exist[bar[i]][0] = 1;
		exist[bar[i]][1] = i;
	}
	
	count = 0;
	for(i = 0;i < n - 2;i++){
		for(j = i + 1;j < n - 1;j++){
			//printf("%d %d\n", bar[i], bar[j]);
			if(l - (bar[i] + bar[j]) > 0 && exist[l - (bar[i] + bar[j])][0] == 1 && exist[l - (bar[i] + bar[j])][1] > j){
				//printf("%d %d\n", bar[i], bar[j]);
				count++;
			}
		}
	}
	printf("%d\n", count);
	
	return 0;
}