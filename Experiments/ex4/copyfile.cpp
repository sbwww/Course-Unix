#include <bits/stdc++.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

using namespace std;

const int _1B = 1;
const int _1KB = _1B * 1024;
const int _1MB = _1KB * 1024;

int main() {
  int n;
  char buf[512];
  char ch = '\n';
  int fd1 = open("file1", O_RDONLY);
  int fd2 = open("file2", O_RDONLY);
  int fd3 = open("file3", O_RDWR);

  int disp = 30 * _1B;
  // int disp = 4 * _1MB;

  printf("disp = %d\n", disp);

  while ((n = read(fd1, buf, 512)) > 0) write(fd3, buf, n);
  lseek(fd3, disp, SEEK_CUR);
  while ((n = read(fd2, buf, 512)) > 0) write(fd3, buf, n);

  close(fd1);
  close(fd2);
  close(fd3);
  return 0;
}