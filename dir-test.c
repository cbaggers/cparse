#include <sys/types.h>
#include <dirent.h>

main() {
  DIR *handle;
  struct dirent *entry;
  int x;

  printf("\n\n============\n");
  handle = opendir("/home/tedchly");
  for (x=0; x<=5; x++) {
    entry = readdir(handle);
    if (entry)
      printf("Entry: %s\n", entry->d_name);
  }
}

