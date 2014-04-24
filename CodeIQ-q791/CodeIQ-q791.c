#include <stdio.h>
 
int main(void) {
	char team[] = "lgs";
	team[0] -= 'a' - 'A';
	team[1] -= 'a' - 'A';
	team[2] -= 'a' - 'A';
	printf("%s", team);
	return 0;
}
