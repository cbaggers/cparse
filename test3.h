// stuff that does not work

/* 64 bits entities */
long long foo4;
typedef long long int int64_t;

/* void function pointer types */
typedef void* obex_t;
typedef void* obex_object_t;
typedef void (*obex_event_t)(obex_t *handle, obex_object_t *obj, int mode, int event, int obex_cmd, int obex_rsp);

/* generic pointer types */
typedef int (*int_func_1)(int x);
typedef int (*int_func_2)(int x, int y);

/* unnamed arguments */
typedef int (*int_func_3)(int, int, int);

// test3.h ends here.
