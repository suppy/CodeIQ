#import <Foundation/Foundation.h>

int main()
{
	// your code goes here
	NSMutableString *team = [NSMutableString stringWithString:@"lgs"];
 	team = [team uppercaseString];
	printf("%s", [team UTF8String]);
	return 0;
}