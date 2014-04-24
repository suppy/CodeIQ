#include <iostream>
#include <algorithm>
#include <string>

using namespace std;

int main() {
	std::string team("lgs");
	transform (team.begin (), team.end (), team.begin (), ::toupper);
	cout << team << "\n";

	return 0;
}