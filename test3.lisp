(UNLESS (FIND-PACKAGE :OBEX) (DEFPACKAGE :OBEX (:SHADOW T)))

(IN-PACKAGE :OBEX)

(PROGN
 (UFFI:DEF-FOREIGN-TYPE INT8-T :CHAR)
 (UFFI:DEF-FOREIGN-TYPE INT16-T :SHORT)
 (UFFI:DEF-FOREIGN-TYPE INT32-T :INT)
 (UFFI:DEF-FOREIGN-TYPE INT64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE UINT8-T :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE UINT16-T :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE UINT32-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE UINT64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE INT-LEAST8-T :CHAR)
 (UFFI:DEF-FOREIGN-TYPE INT-LEAST16-T :SHORT)
 (UFFI:DEF-FOREIGN-TYPE INT-LEAST32-T :INT)
 (UFFI:DEF-FOREIGN-TYPE INT-LEAST64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE UINT-LEAST8-T :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE UINT-LEAST16-T :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE UINT-LEAST32-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE UINT-LEAST64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE INT-FAST8-T :CHAR)
 (UFFI:DEF-FOREIGN-TYPE INT-FAST16-T :INT)
 (UFFI:DEF-FOREIGN-TYPE INT-FAST32-T :INT)
 (UFFI:DEF-FOREIGN-TYPE INT-FAST64-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE UINT-FAST8-T :UNSIGNED-CHAR)
 (UFFI:DEF-FOREIGN-TYPE UINT-FAST16-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE UINT-FAST32-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE UINT-FAST64-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE INTPTR-T :INT)
 (UFFI:DEF-FOREIGN-TYPE UINTPTR-T :UNSIGNED-INT)
 (UFFI:DEF-FOREIGN-TYPE INTMAX-T :LONG)
 (UFFI:DEF-FOREIGN-TYPE UINTMAX-T :UNSIGNED-LONG)
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
 (UFFI:DEF-FOREIGN-TYPE FSFILCNT-T :UNSIGNED-LONG)
 (UFFI:DEF-FOREIGN-TYPE NIL
                        (:STRUCT IOVEC (IOV-BASE :POINTER-VOID)
                         (IOV-LEN :UNSIGNED-INT)))
 (PROGN
  (DECLAIM (INLINE READV))
  (UFFI:DEF-FUNCTION "readv"
                     ((--FD :INT)
                      (--VECTOR
                       (*
                        (:STRUCT IOVEC (IOV-BASE :POINTER-VOID)
                         (IOV-LEN :UNSIGNED-INT))))
                      (--COUNT :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE WRITEV))
  (UFFI:DEF-FUNCTION "writev"
                     ((--FD :INT)
                      (--VECTOR
                       (*
                        (:STRUCT IOVEC (IOV-BASE :POINTER-VOID)
                         (IOV-LEN :UNSIGNED-INT))))
                      (--COUNT :INT))
                     :RETURNING
                     :INT))
 (UFFI:DEF-FOREIGN-TYPE SOCKLEN-T :UNSIGNED-INT)
 (UFFI:DEF-ENUM --SOCKET-TYPE
                ((:SOCK-STREAM 1) (:SOCK-DGRAM 2) (:SOCK-RAW 3) (:SOCK-RDM 4)
                 (:SOCK-SEQPACKET 5) (:SOCK-PACKET 10)))
 (UFFI:DEF-FOREIGN-TYPE SA-FAMILY-T :UNSIGNED-SHORT)
 (UFFI:DEF-FOREIGN-TYPE NIL
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14))))
 (UFFI:DEF-FOREIGN-TYPE NIL
                        (:STRUCT SOCKADDR-STORAGE (SS-FAMILY :UNSIGNED-SHORT)
                         (--SS-ALIGN :UNSIGNED-INT)
                         (--SS-PADDING (:ARRAY :CHAR 120))))
 (UFFI:DEF-ENUM UFFI-ALIEN::ENUM
                ((:MSG-OOB 1) (:MSG-PEEK 2) (:MSG-DONTROUTE 4) (:MSG-CTRUNC 8)
                 (:MSG-PROXY 16) (:MSG-TRUNC 32) (:MSG-DONTWAIT 64)
                 (:MSG-EOR 128) (:MSG-WAITALL 256) (:MSG-FIN 512)
                 (:MSG-SYN 1024) (:MSG-CONFIRM 2048) (:MSG-RST 4096)
                 (:MSG-ERRQUEUE 8192) (:MSG-NOSIGNAL 16384) (:MSG-MORE 32768)))
 (UFFI:DEF-FOREIGN-TYPE NIL
                        (:STRUCT MSGHDR (MSG-NAME :POINTER-VOID)
                         (MSG-NAMELEN :UNSIGNED-INT)
                         (MSG-IOV
                          (*
                           (:STRUCT IOVEC (IOV-BASE :POINTER-VOID)
                            (IOV-LEN :UNSIGNED-INT))))
                         (MSG-IOVLEN :UNSIGNED-INT) (MSG-CONTROL :POINTER-VOID)
                         (MSG-CONTROLLEN :UNSIGNED-INT) (MSG-FLAGS :INT)))
 (UFFI:DEF-FOREIGN-TYPE NIL
                        (:STRUCT CMSGHDR (CMSG-LEN :UNSIGNED-INT)
                         (CMSG-LEVEL :INT) (CMSG-TYPE :INT)
                         (--CMSG-DATA (:ARRAY :UNSIGNED-CHAR 0))))
 (PROGN
  (DECLAIM (INLINE --CMSG-NXTHDR))
  (UFFI:DEF-FUNCTION "__cmsg_nxthdr"
                     ((--MHDR
                       (*
                        (:STRUCT MSGHDR (MSG-NAME :POINTER-VOID)
                         (MSG-NAMELEN :UNSIGNED-INT)
                         (MSG-IOV
                          (*
                           (:STRUCT IOVEC (IOV-BASE :POINTER-VOID)
                            (IOV-LEN :UNSIGNED-INT))))
                         (MSG-IOVLEN :UNSIGNED-INT) (MSG-CONTROL :POINTER-VOID)
                         (MSG-CONTROLLEN :UNSIGNED-INT) (MSG-FLAGS :INT))))
                      (--CMSG
                       (*
                        (:STRUCT CMSGHDR (CMSG-LEN :UNSIGNED-INT)
                         (CMSG-LEVEL :INT) (CMSG-TYPE :INT)
                         (--CMSG-DATA (:ARRAY :UNSIGNED-CHAR 0))))))
                     :RETURNING
                     (*
                      (:STRUCT CMSGHDR (CMSG-LEN :UNSIGNED-INT)
                       (CMSG-LEVEL :INT) (CMSG-TYPE :INT)
                       (--CMSG-DATA (:ARRAY :UNSIGNED-CHAR 0))))))
 (UFFI:DEF-ENUM UFFI-ALIEN::ENUM
                ((:SCM-RIGHTS 1) (:SCM-CREDENTIALS 2) (:--SCM-CONNECT 3)))
 (UFFI:DEF-FOREIGN-TYPE NIL
                        (:STRUCT UCRED (PID :INT) (UID :UNSIGNED-INT)
                         (GID :UNSIGNED-INT)))
 (UFFI:DEF-FOREIGN-TYPE NIL (:STRUCT LINGER (L-ONOFF :INT) (L-LINGER :INT)))
 (UFFI:DEF-FOREIGN-TYPE NIL
                        (:STRUCT OSOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :UNSIGNED-CHAR 14))))
 (UFFI:DEF-ENUM UFFI-ALIEN::ENUM ((:SHUT-RD 0) (:SHUT-WR 1) (:SHUT-RDWR 2)))
 (PROGN
  (DECLAIM (INLINE SOCKET))
  (UFFI:DEF-FUNCTION "socket"
                     ((--DOMAIN :INT) (--TYPE :INT) (--PROTOCOL :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE SOCKETPAIR))
  (UFFI:DEF-FUNCTION "socketpair"
                     ((--DOMAIN :INT) (--TYPE :INT) (--PROTOCOL :INT)
                      (--FDS (:ARRAY :INT 2)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE BIND))
  (UFFI:DEF-FUNCTION "bind"
                     ((--FD :INT)
                      (--ADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (--LEN :UNSIGNED-INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE GETSOCKNAME))
  (UFFI:DEF-FUNCTION "getsockname"
                     ((--FD :INT)
                      (--ADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (--LEN (* :UNSIGNED-INT)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE CONNECT))
  (UFFI:DEF-FUNCTION "connect"
                     ((--FD :INT)
                      (--ADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (--LEN :UNSIGNED-INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE GETPEERNAME))
  (UFFI:DEF-FUNCTION "getpeername"
                     ((--FD :INT)
                      (--ADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (--LEN (* :UNSIGNED-INT)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE SEND))
  (UFFI:DEF-FUNCTION "send"
                     ((--FD :INT) (--BUF :POINTER-VOID) (--N :UNSIGNED-INT)
                      (--FLAGS :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE RECV))
  (UFFI:DEF-FUNCTION "recv"
                     ((--FD :INT) (--BUF :POINTER-VOID) (--N :UNSIGNED-INT)
                      (--FLAGS :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE SENDTO))
  (UFFI:DEF-FUNCTION "sendto"
                     ((--FD :INT) (--BUF :POINTER-VOID) (--N :UNSIGNED-INT)
                      (--FLAGS :INT)
                      (--ADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (--ADDR-LEN :UNSIGNED-INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE RECVFROM))
  (UFFI:DEF-FUNCTION "recvfrom"
                     ((--FD :INT) (--BUF :POINTER-VOID) (--N :UNSIGNED-INT)
                      (--FLAGS :INT)
                      (--ADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (--ADDR-LEN (* :UNSIGNED-INT)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE SENDMSG))
  (UFFI:DEF-FUNCTION "sendmsg"
                     ((--FD :INT)
                      (--MESSAGE
                       (*
                        (:STRUCT MSGHDR (MSG-NAME :POINTER-VOID)
                         (MSG-NAMELEN :UNSIGNED-INT)
                         (MSG-IOV
                          (*
                           (:STRUCT IOVEC (IOV-BASE :POINTER-VOID)
                            (IOV-LEN :UNSIGNED-INT))))
                         (MSG-IOVLEN :UNSIGNED-INT) (MSG-CONTROL :POINTER-VOID)
                         (MSG-CONTROLLEN :UNSIGNED-INT) (MSG-FLAGS :INT))))
                      (--FLAGS :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE RECVMSG))
  (UFFI:DEF-FUNCTION "recvmsg"
                     ((--FD :INT)
                      (--MESSAGE
                       (*
                        (:STRUCT MSGHDR (MSG-NAME :POINTER-VOID)
                         (MSG-NAMELEN :UNSIGNED-INT)
                         (MSG-IOV
                          (*
                           (:STRUCT IOVEC (IOV-BASE :POINTER-VOID)
                            (IOV-LEN :UNSIGNED-INT))))
                         (MSG-IOVLEN :UNSIGNED-INT) (MSG-CONTROL :POINTER-VOID)
                         (MSG-CONTROLLEN :UNSIGNED-INT) (MSG-FLAGS :INT))))
                      (--FLAGS :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE GETSOCKOPT))
  (UFFI:DEF-FUNCTION "getsockopt"
                     ((--FD :INT) (--LEVEL :INT) (--OPTNAME :INT)
                      (--OPTVAL :POINTER-VOID) (--OPTLEN (* :UNSIGNED-INT)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE SETSOCKOPT))
  (UFFI:DEF-FUNCTION "setsockopt"
                     ((--FD :INT) (--LEVEL :INT) (--OPTNAME :INT)
                      (--OPTVAL :POINTER-VOID) (--OPTLEN :UNSIGNED-INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE LISTEN))
  (UFFI:DEF-FUNCTION "listen" ((--FD :INT) (--N :INT)) :RETURNING :INT))
 (PROGN
  (DECLAIM (INLINE ACCEPT))
  (UFFI:DEF-FUNCTION "accept"
                     ((--FD :INT)
                      (--ADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (--ADDR-LEN (* :UNSIGNED-INT)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE SHUTDOWN))
  (UFFI:DEF-FUNCTION "shutdown" ((--FD :INT) (--HOW :INT)) :RETURNING :INT))
 (PROGN
  (DECLAIM (INLINE ISFDTYPE))
  (UFFI:DEF-FUNCTION "isfdtype" ((--FD :INT) (--FDTYPE :INT)) :RETURNING :INT))
 (UFFI:DEF-FOREIGN-TYPE OBEX-T :POINTER-VOID)
 (UFFI:DEF-FOREIGN-TYPE OBEX-OBJECT-T :POINTER-VOID)
 (UFFI:DEF-FOREIGN-TYPE OBEX-EVENT-T
                        (*
                         (FUNCTION :VOID (HANDLE (* :POINTER-VOID))
                          (OBJ (* :POINTER-VOID)) (MODE :INT) (EVENT :INT)
                          (OBEX-CMD :INT) (OBEX-RSP :INT))))
 (UFFI:DEF-FOREIGN-TYPE BDADDR-T (* :CHAR))
 (UFFI:DEF-FOREIGN-TYPE OBEX-HEADERDATA-T
                        (:UNION NIL (BQ4 :UNSIGNED-INT) (BQ1 :UNSIGNED-CHAR)
                         (BS (* :UNSIGNED-CHAR))))
 (UFFI:DEF-FOREIGN-TYPE OBEX-CTRANS-T
                        (:STRUCT NIL
                         (CONNECT
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID))))
                         (DISCONNECT
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID))))
                         (LISTEN
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID))))
                         (WRITE
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID) (BUF (* :UNSIGNED-CHAR))
                            (BUFLEN :INT))))
                         (HANDLEINPUT
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID) (TIMEOUT :INT))))
                         (CUSTOMDATA :POINTER-VOID)))
 (PROGN
  (DECLAIM (INLINE OBEX-INIT))
  (UFFI:DEF-FUNCTION "OBEX_Init"
                     ((TRANSPORT :INT)
                      (EVENTCB
                       (*
                        (FUNCTION :VOID (HANDLE (* :POINTER-VOID))
                         (OBJ (* :POINTER-VOID)) (MODE :INT) (EVENT :INT)
                         (OBEX-CMD :INT) (OBEX-RSP :INT))))
                      (FLAGS :UNSIGNED-INT))
                     :RETURNING
                     (* :POINTER-VOID)))
 (PROGN
  (DECLAIM (INLINE OBEX-CLEANUP))
  (UFFI:DEF-FUNCTION "OBEX_Cleanup"
                     ((SELF (* :POINTER-VOID)))
                     :RETURNING
                     :VOID))
 (PROGN
  (DECLAIM (INLINE OBEX-SETUSERDATA))
  (UFFI:DEF-FUNCTION "OBEX_SetUserData"
                     ((SELF (* :POINTER-VOID)) (DATA :POINTER-VOID))
                     :RETURNING
                     :VOID))
 (PROGN
  (DECLAIM (INLINE OBEX-GETUSERDATA))
  (UFFI:DEF-FUNCTION "OBEX_GetUserData"
                     ((SELF (* :POINTER-VOID)))
                     :RETURNING
                     :POINTER-VOID))
 (PROGN
  (DECLAIM (INLINE OBEX-SETUSERCALLBACK))
  (UFFI:DEF-FUNCTION "OBEX_SetUserCallBack"
                     ((SELF (* :POINTER-VOID))
                      (EVENTCB
                       (*
                        (FUNCTION :VOID (HANDLE (* :POINTER-VOID))
                         (OBJ (* :POINTER-VOID)) (MODE :INT) (EVENT :INT)
                         (OBEX-CMD :INT) (OBEX-RSP :INT))))
                      (DATA :POINTER-VOID))
                     :RETURNING
                     :VOID))
 (PROGN
  (DECLAIM (INLINE OBEX-SETTRANSPORTMTU))
  (UFFI:DEF-FUNCTION "OBEX_SetTransportMTU"
                     ((SELF (* :POINTER-VOID)) (MTU-RX :UNSIGNED-SHORT)
                      (MTU-TX-MAX :UNSIGNED-SHORT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-GETFD))
  (UFFI:DEF-FUNCTION "OBEX_GetFD" ((SELF (* :POINTER-VOID))) :RETURNING :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-REGISTERCTRANSPORT))
  (UFFI:DEF-FUNCTION "OBEX_RegisterCTransport"
                     ((SELF (* :POINTER-VOID))
                      (CTRANS
                       (*
                        (:STRUCT NIL
                         (CONNECT
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID))))
                         (DISCONNECT
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID))))
                         (LISTEN
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID))))
                         (WRITE
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID) (BUF (* :UNSIGNED-CHAR))
                            (BUFLEN :INT))))
                         (HANDLEINPUT
                          (*
                           (FUNCTION :INT (HANDLE (* :POINTER-VOID))
                            (CUSTOMDATA :POINTER-VOID) (TIMEOUT :INT))))
                         (CUSTOMDATA :POINTER-VOID)))))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-SETCUSTOMDATA))
  (UFFI:DEF-FUNCTION "OBEX_SetCustomData"
                     ((SELF (* :POINTER-VOID)) (DATA :POINTER-VOID))
                     :RETURNING
                     :VOID))
 (PROGN
  (DECLAIM (INLINE OBEX-GETCUSTOMDATA))
  (UFFI:DEF-FUNCTION "OBEX_GetCustomData"
                     ((SELF (* :POINTER-VOID)))
                     :RETURNING
                     :POINTER-VOID))
 (PROGN
  (DECLAIM (INLINE OBEX-TRANSPORTCONNECT))
  (UFFI:DEF-FUNCTION "OBEX_TransportConnect"
                     ((SELF (* :POINTER-VOID))
                      (SADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (ADDLEN :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-TRANSPORTDISCONNECT))
  (UFFI:DEF-FUNCTION "OBEX_TransportDisconnect"
                     ((SELF (* :POINTER-VOID)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-CUSTOMDATAFEED))
  (UFFI:DEF-FUNCTION "OBEX_CustomDataFeed"
                     ((SELF (* :POINTER-VOID)) (INPUTBUF (* :UNSIGNED-CHAR))
                      (ACTUAL :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-HANDLEINPUT))
  (UFFI:DEF-FUNCTION "OBEX_HandleInput"
                     ((SELF (* :POINTER-VOID)) (TIMEOUT :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-SERVERREGISTER))
  (UFFI:DEF-FUNCTION "OBEX_ServerRegister"
                     ((SELF (* :POINTER-VOID))
                      (SADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (ADDRLEN :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-SERVERACCEPT))
  (UFFI:DEF-FUNCTION "OBEX_ServerAccept"
                     ((SERVER (* :POINTER-VOID))
                      (EVENTCB
                       (*
                        (FUNCTION :VOID (HANDLE (* :POINTER-VOID))
                         (OBJ (* :POINTER-VOID)) (MODE :INT) (EVENT :INT)
                         (OBEX-CMD :INT) (OBEX-RSP :INT))))
                      (DATA :POINTER-VOID))
                     :RETURNING
                     (* :POINTER-VOID)))
 (PROGN
  (DECLAIM (INLINE OBEX-REQUEST))
  (UFFI:DEF-FUNCTION "OBEX_Request"
                     ((SELF (* :POINTER-VOID)) (OBJECT (* :POINTER-VOID)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-CANCELREQUEST))
  (UFFI:DEF-FUNCTION "OBEX_CancelRequest"
                     ((SELF (* :POINTER-VOID)) (NICE :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTNEW))
  (UFFI:DEF-FUNCTION "OBEX_ObjectNew"
                     ((SELF (* :POINTER-VOID)) (CMD :UNSIGNED-CHAR))
                     :RETURNING
                     (* :POINTER-VOID)))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTDELETE))
  (UFFI:DEF-FUNCTION "OBEX_ObjectDelete"
                     ((SELF (* :POINTER-VOID)) (OBJECT (* :POINTER-VOID)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTADDHEADER))
  (UFFI:DEF-FUNCTION "OBEX_ObjectAddHeader"
                     ((SELF (* :POINTER-VOID)) (OBJECT (* :POINTER-VOID))
                      (HI :UNSIGNED-CHAR)
                      (HV
                       (:UNION NIL (BQ4 :UNSIGNED-INT) (BQ1 :UNSIGNED-CHAR)
                        (BS (* :UNSIGNED-CHAR))))
                      (HV-SIZE :UNSIGNED-INT) (FLAGS :UNSIGNED-INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTGETNEXTHEADER))
  (UFFI:DEF-FUNCTION "OBEX_ObjectGetNextHeader"
                     ((SELF (* :POINTER-VOID)) (OBJECT (* :POINTER-VOID))
                      (HI (* :UNSIGNED-CHAR))
                      (HV
                       (*
                        (:UNION NIL (BQ4 :UNSIGNED-INT) (BQ1 :UNSIGNED-CHAR)
                         (BS (* :UNSIGNED-CHAR)))))
                      (HV-SIZE (* :UNSIGNED-INT)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTREPARSEHEADERS))
  (UFFI:DEF-FUNCTION "OBEX_ObjectReParseHeaders"
                     ((SELF (* :POINTER-VOID)) (OBJECT (* :POINTER-VOID)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTSETRSP))
  (UFFI:DEF-FUNCTION "OBEX_ObjectSetRsp"
                     ((OBJECT (* :POINTER-VOID)) (RSP :UNSIGNED-CHAR)
                      (LASTRSP :UNSIGNED-CHAR))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTGETNONHDRDATA))
  (UFFI:DEF-FUNCTION "OBEX_ObjectGetNonHdrData"
                     ((OBJECT (* :POINTER-VOID))
                      (BUFFER (* (* :UNSIGNED-CHAR))))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTSETNONHDRDATA))
  (UFFI:DEF-FUNCTION "OBEX_ObjectSetNonHdrData"
                     ((OBJECT (* :POINTER-VOID)) (BUFFER (* :UNSIGNED-CHAR))
                      (LEN :UNSIGNED-INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTSETHDROFFSET))
  (UFFI:DEF-FUNCTION "OBEX_ObjectSetHdrOffset"
                     ((OBJECT (* :POINTER-VOID)) (OFFSET :UNSIGNED-INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-OBJECTREADSTREAM))
  (UFFI:DEF-FUNCTION "OBEX_ObjectReadStream"
                     ((SELF (* :POINTER-VOID)) (OBJECT (* :POINTER-VOID))
                      (BUF (* (* :UNSIGNED-CHAR))))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-UNICODETOCHAR))
  (UFFI:DEF-FUNCTION "OBEX_UnicodeToChar"
                     ((C (* :UNSIGNED-CHAR)) (UC (* :UNSIGNED-CHAR))
                      (SIZE :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-CHARTOUNICODE))
  (UFFI:DEF-FUNCTION "OBEX_CharToUnicode"
                     ((UC (* :UNSIGNED-CHAR)) (C (* :UNSIGNED-CHAR))
                      (SIZE :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE OBEX-RESPONSETOSTRING))
  (UFFI:DEF-FUNCTION "OBEX_ResponseToString"
                     ((RSP :INT))
                     :RETURNING
                     (* :CHAR)))
 (PROGN
  (DECLAIM (INLINE OBEX-GETRESPONSEMESSAGE))
  (UFFI:DEF-FUNCTION "OBEX_GetResponseMessage"
                     ((SELF (* :POINTER-VOID)) (RSP :INT))
                     :RETURNING
                     (* :CHAR)))
 (PROGN
  (DECLAIM (INLINE INOBEX-SERVERREGISTER))
  (UFFI:DEF-FUNCTION "InOBEX_ServerRegister"
                     ((SELF (* :POINTER-VOID)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE INOBEX-TRANSPORTCONNECT))
  (UFFI:DEF-FUNCTION "InOBEX_TransportConnect"
                     ((SELF (* :POINTER-VOID))
                      (SADDR
                       (*
                        (:STRUCT SOCKADDR (SA-FAMILY :UNSIGNED-SHORT)
                         (SA-DATA (:ARRAY :CHAR 14)))))
                      (ADDRLEN :INT))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE IROBEX-SERVERREGISTER))
  (UFFI:DEF-FUNCTION "IrOBEX_ServerRegister"
                     ((SELF (* :POINTER-VOID)) (SERVICE (* :CHAR)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE IROBEX-TRANSPORTCONNECT))
  (UFFI:DEF-FUNCTION "IrOBEX_TransportConnect"
                     ((SELF (* :POINTER-VOID)) (SERVICE (* :CHAR)))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE BTOBEX-SERVERREGISTER))
  (UFFI:DEF-FUNCTION "BtOBEX_ServerRegister"
                     ((SELF (* :POINTER-VOID)) (SRC (* (* :CHAR)))
                      (CHANNEL :UNSIGNED-CHAR))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE BTOBEX-TRANSPORTCONNECT))
  (UFFI:DEF-FUNCTION "BtOBEX_TransportConnect"
                     ((SELF (* :POINTER-VOID)) (SRC (* (* :CHAR)))
                      (DST (* (* :CHAR))) (CHANNEL :UNSIGNED-CHAR))
                     :RETURNING
                     :INT))
 (PROGN
  (DECLAIM (INLINE FDOBEX-TRANSPORTSETUP))
  (UFFI:DEF-FUNCTION "FdOBEX_TransportSetup"
                     ((SELF (* :POINTER-VOID)) (RFD :INT) (WFD :INT)
                      (MTU :INT))
                     :RETURNING
                     :INT)))
