

struct foo {
  int a;
  //struct foo *b[100]; //yields an infinite loop somewhere in cparse
  struct fooxx *b[100];
};
    
/*** 

CMUCL:

    (alien:def-alien-type nil
      (alien:struct foo
        (a int)
        (b (array (* (alien:struct foo)) 100))))

UFFI:

    (uffi:def-struct foo
        (a :int)
        (b (:array :pointer-self 100))) ;this doesn't work anyway

UFFI NG:

    (uffi:def-foreign-type nil
      (:struct foo
        (a :int)
        (b (:array (* (:struct foo)) 100))))

*/

struct c_struct {
  short x, y;
  char a, b;
  int z;
  struct c_structxx *n;
};
    
/*** 

CMUCL:

    (alien:def-alien-type nil
      (alien:struct c-struct
              (x c-call:short)
              (y c-call:short)
              (a char)
              (b char)
              (z integer)
              (n (* (alien:struct c-struct)))))
 
UFFI:

    (uffi:def-struct c-struct
              (x :short)
              (y :short)
              (a :char)
              (b :char)
              (z :int)
              (n :pointer-self))

UFFI NG:

    (uffi:def-struct c-struct
              (x :short)
              (y :short)
              (a :char)
              (b :char)
              (z :int)
              (n :pointer-self))
*/
