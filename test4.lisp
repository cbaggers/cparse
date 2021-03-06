(UNLESS (FIND-PACKAGE :DIR-TEST) (DEFPACKAGE :DIR-TEST (:SHADOW T)))

(IN-PACKAGE :DIR-TEST)

(PROGN
 (UFFI:DEF-FOREIGN-TYPE SIZE-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --U-CHAR :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE --U-SHORT :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE --U-INT :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --U-LONG :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --INT8-T :CHAR)
 (UFFI:DEF-FOREIGN-TYPE --UINT8-T :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE --INT16-T :SHORT)
 (UFFI:DEF-FOREIGN-TYPE --UINT16-T :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE --INT32-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --UINT32-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --INT64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --UINT64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --QUAD-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --U-QUAD-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --DEV-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --UID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --GID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --INO-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --INO64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --MODE-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --NLINK-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --OFF-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --OFF64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --PID-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --FSID-T (:STRUCT NIL (--VAL (:ARRAY :INT 2))))
 (UFFI:DEF-FOREIGN-TYPE --CLOCK-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --RLIM-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --RLIM64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --ID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --TIME-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --USECONDS-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --SUSECONDS-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --DADDR-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --SWBLK-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --KEY-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --CLOCKID-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --TIMER-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --BLKSIZE-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --BLKCNT-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --BLKCNT64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSBLKCNT-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSBLKCNT64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSFILCNT-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSFILCNT64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --SSIZE-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --LOFF-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --QADDR-T (* :LONG))
 (UFFI:DEF-FOREIGN-TYPE --CADDR-T (* :CHAR))
 (UFFI:DEF-FOREIGN-TYPE --INTPTR-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --SOCKLEN-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE U-CHAR :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE U-SHORT :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE U-INT :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE U-LONG :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE QUAD-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE U-QUAD-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE FSID-T (:STRUCT NIL (--VAL (:ARRAY :INT 2))))
 (UFFI:DEF-FOREIGN-TYPE LOFF-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE INO-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE DEV-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE GID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE MODE-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE NLINK-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE UID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE OFF-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE PID-T :INT)
 (UFFI:DEF-FOREIGN-TYPE ID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE SSIZE-T :INT)
 (UFFI:DEF-FOREIGN-TYPE DADDR-T :INT)
 (UFFI:DEF-FOREIGN-TYPE CADDR-T (* :CHAR))
 (UFFI:DEF-FOREIGN-TYPE KEY-T :INT)
 (UFFI:DEF-FOREIGN-TYPE TIME-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE CLOCKID-T :INT)
 (UFFI:DEF-FOREIGN-TYPE TIMER-T :INT)
 (UFFI:DEF-FOREIGN-TYPE ULONG :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE USHORT :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE UINT :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE INT8-T :INT)
 (UFFI:DEF-FOREIGN-TYPE INT16-T :INT)
 (UFFI:DEF-FOREIGN-TYPE INT32-T :INT)
 (UFFI:DEF-FOREIGN-TYPE INT64-T :INT)
 (UFFI:DEF-FOREIGN-TYPE U-INT8-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE U-INT16-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE U-INT32-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE U-INT64-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE REGISTER-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --SIG-ATOMIC-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --SIGSET-T
                        (:STRUCT NIL (--VAL (:ARRAY :UNSIGNED-LONG 32))))
 (UFFI:DEF-FOREIGN-TYPE SIGSET-T
                        (:STRUCT NIL (--VAL (:ARRAY :UNSIGNED-LONG 32))))
 (UFFI:DEF-FOREIGN-TYPE NIL (:STRUCT TIMESPEC (TV-SEC :LONG) (TV-NSEC :LONG)))
 (UFFI:DEF-FOREIGN-TYPE NIL (:STRUCT TIMEVAL (TV-SEC :LONG) (TV-USEC :LONG)))
 (UFFI:DEF-FOREIGN-TYPE SUSECONDS-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --FD-MASK :LONG)
 (UFFI:DEF-FOREIGN-TYPE FD-SET (:STRUCT NIL (--FDS-BITS (:ARRAY :LONG 32))))
 (UFFI:DEF-FOREIGN-TYPE FD-MASK :LONG)
 (PROGN
  (DECLAIM (INLINE SELECT))
  (UFFI:DEF-FUNCTION "select"
                     ((--NFDS :INT)
                      (--READFDS
                       (* (:STRUCT NIL (--FDS-BITS (:ARRAY :LONG 32)))))
                      (--WRITEFDS
                       (* (:STRUCT NIL (--FDS-BITS (:ARRAY :LONG 32)))))
                      (--EXCEPTFDS
                       (* (:STRUCT NIL (--FDS-BITS (:ARRAY :LONG 32)))))
                      (--TIMEOUT
                       (* (:STRUCT TIMEVAL (TV-SEC :LONG) (TV-USEC :LONG)))))
                     :RETURNING
                     :INT))
 (UFFI:DEF-FOREIGN-TYPE BLKCNT-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE FSBLKCNT-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE FSFILCNT-T :UNSIGNED-LONG))
(PROGN
 (UFFI:DEF-FOREIGN-TYPE SIZE-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --U-CHAR :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE --U-SHORT :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE --U-INT :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --U-LONG :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --INT8-T :CHAR)
 (UFFI:DEF-FOREIGN-TYPE --UINT8-T :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE --INT16-T :SHORT)
 (UFFI:DEF-FOREIGN-TYPE --UINT16-T :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE --INT32-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --UINT32-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --INT64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --UINT64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --QUAD-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --U-QUAD-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --DEV-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --UID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --GID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --INO-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --INO64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --MODE-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --NLINK-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --OFF-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --OFF64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --PID-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --FSID-T (:STRUCT NIL (--VAL (:ARRAY :INT 2))))
 (UFFI:DEF-FOREIGN-TYPE --CLOCK-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --RLIM-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --RLIM64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --ID-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --TIME-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --USECONDS-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE --SUSECONDS-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --DADDR-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --SWBLK-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --KEY-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --CLOCKID-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --TIMER-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --BLKSIZE-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --BLKCNT-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --BLKCNT64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSBLKCNT-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSBLKCNT64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSFILCNT-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --FSFILCNT64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE --SSIZE-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --LOFF-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE --QADDR-T (* :LONG))
 (UFFI:DEF-FOREIGN-TYPE --CADDR-T (* :CHAR))
 (UFFI:DEF-FOREIGN-TYPE --INTPTR-T :INT)
 (UFFI:DEF-FOREIGN-TYPE --SOCKLEN-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE dirent
                        (:STRUCT DIRENT (D-INO :UNSIGNED-LONG) (D-OFF :LONG)
                         (D-RECLEN :UNSIGNED-SHORT) (D-TYPE :UNSIGNED-CHAR)
                         (D-NAME (:ARRAY :CHAR 256))))
 (UFFI:DEF-ENUM UFFI-ALIEN::ENUM
                ((:DT-UNKNOWN 0) (:DT-FIFO 1) (:DT-CHR 2) (:DT-DIR 4)
                 (:DT-BLK 6) (:DT-REG 8) (:DT-LNK 10) (:DT-SOCK 12)
                 (:DT-WHT 14)))
 (UFFI:DEF-FOREIGN-TYPE DIR (:STRUCT --DIRSTREAM))
 (PROGN
  (DECLAIM (INLINE OPENDIR))
  (UFFI:DEF-FUNCTION "opendir"
                     ((--NAME (* :CHAR)))
                     :RETURNING
                     (* (:STRUCT --DIRSTREAM))))
 (PROGN
  (DECLAIM (INLINE CLOSEDIR))
  (UFFI:DEF-FUNCTION "closedir"
                     ((--DIRP (* (:STRUCT --DIRSTREAM))))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE READDIR))
  (UFFI:DEF-FUNCTION "readdir"
                     ((--DIRP (* (:STRUCT --DIRSTREAM))))
                     :RETURNING
                     (*
                      (:STRUCT DIRENT (D-INO :UNSIGNED-LONG) (D-OFF :LONG)
                       (D-RECLEN :UNSIGNED-SHORT) (D-TYPE :UNSIGNED-CHAR)
                       (D-NAME (:ARRAY :CHAR 256))))))
 (PROGN
  (DECLAIM (INLINE READDIR-R))
  (UFFI:DEF-FUNCTION "readdir_r"
                     ((--DIRP (* (:STRUCT --DIRSTREAM)))
                      (--ENTRY
                       (*
                        (:STRUCT DIRENT (D-INO :UNSIGNED-LONG) (D-OFF :LONG)
                         (D-RECLEN :UNSIGNED-SHORT) (D-TYPE :UNSIGNED-CHAR)
                         (D-NAME (:ARRAY :CHAR 256)))))
                      (--RESULT
                       (*
                        (*
                         (:STRUCT DIRENT (D-INO :UNSIGNED-LONG) (D-OFF :LONG)
                          (D-RECLEN :UNSIGNED-SHORT) (D-TYPE :UNSIGNED-CHAR)
                          (D-NAME (:ARRAY :CHAR 256)))))))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE REWINDDIR))
  (UFFI:DEF-FUNCTION "rewinddir"
                     ((--DIRP (* (:STRUCT --DIRSTREAM))))
                     :RETURNING
                     :VOID))
 (PROGN
  (DECLAIM (INLINE SEEKDIR))
  (UFFI:DEF-FUNCTION "seekdir"
                     ((--DIRP (* (:STRUCT --DIRSTREAM))) (--POS :LONG))
                     :RETURNING
                     :VOID))
 (PROGN
  (DECLAIM (INLINE TELLDIR))
  (UFFI:DEF-FUNCTION "telldir"
                     ((--DIRP (* (:STRUCT --DIRSTREAM))))
                     :RETURNING
                     :LONG))
 (PROGN
  (DECLAIM (INLINE DIRFD))
  (UFFI:DEF-FUNCTION "dirfd"
                     ((--DIRP (* (:STRUCT --DIRSTREAM))))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE SCANDIR))
  (UFFI:DEF-FUNCTION "scandir"
                     ((--DIR (* :CHAR))
                      (--NAMELIST
                       (*
                        (*
                         (*
                          (:STRUCT DIRENT (D-INO :UNSIGNED-LONG) (D-OFF :LONG)
                           (D-RECLEN :UNSIGNED-SHORT) (D-TYPE :UNSIGNED-CHAR)
                           (D-NAME (:ARRAY :CHAR 256)))))))
                      (--SELECTOR
                       (*
                        (FUNCTION :INT
                         (NIL
                          (*
                           (:STRUCT DIRENT (D-INO :UNSIGNED-LONG) (D-OFF :LONG)
                            (D-RECLEN :UNSIGNED-SHORT) (D-TYPE :UNSIGNED-CHAR)
                            (D-NAME (:ARRAY :CHAR 256))))))))
                      (--CMP
                       (*
                        (FUNCTION :INT (NIL :POINTER-VOID)
                         (NIL :POINTER-VOID)))))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE ALPHASORT))
  (UFFI:DEF-FUNCTION "alphasort"
                     ((|--E1| :POINTER-VOID) (|--E2| :POINTER-VOID))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE GETDIRENTRIES))
  (UFFI:DEF-FUNCTION "getdirentries"
                     ((--FD :INT) (--BUF (* :CHAR)) (--NBYTES :UNSIGNED-INT)
                      (--BASEP (* :LONG)))
                     :RETURNING
                     :INT)))
