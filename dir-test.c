#include <sys/types.h>
#include <dirent.h>

main() {
  DIR *handle;
  struct dirent *entry;
  int x = 0;

  printf("DIRTEST/c\n");
  handle = opendir("/tmp");
  entry = (struct dirent *)1;
  while (handle && entry) {
    entry = readdir(handle);
    if (entry)
      printf("%d: %s\n", x++, entry->d_name);
  }
  closedir(handle);
}

