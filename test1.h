// miscelleanous tests.

int error;

int last_error();

void set_error(int code);

struct { int bar; char baz; } hello;

enum {one,two,three};

unsigned long foo1;

unsigned long int foo2;

unsigned long int foo3[64];

struct cmsghdr
  {
    int cmsg_level;
    int cmsg_type;
    unsigned char __cmsg_data [];
  };

typedef signed char int8_t;

typedef unsigned int size_t;

#define _SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))
typedef struct
  {
    unsigned long int __val[_SIGSET_NWORDS];
  } __sigset_t;

typedef struct { int __val[2]; } fsid_t;

// test1.h ends here.
