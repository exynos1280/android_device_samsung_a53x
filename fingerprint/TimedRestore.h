#pragma once

#include <string>

class TimedRestore {
  std::string filename;
  int saved_value;
 public:
  TimedRestore() = delete;
  TimedRestore(const std::string& filename);
  ~TimedRestore();

  void set(const int value);
};
