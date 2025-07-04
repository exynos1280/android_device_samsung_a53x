#include "TimedRestore.h"
#include <fstream>

TimedRestore::TimedRestore(const std::string& filename)
: filename(filename) {
	std::ifstream ifs(filename);
	if (ifs.fail()) return;
	ifs >> saved_value;
}

TimedRestore::~TimedRestore(void) {
	std::ofstream ofs(filename);
	if (ofs.fail()) return;
	ofs << saved_value;
}

void TimedRestore::set(const int content)
{
	std::ofstream ofs(filename);
	if (saved_value > content) return;
	if (ofs.fail()) return;
	ofs << content;
}
