section	.text
   global _start                   ;must be declared for ld linker

_start:                            ;tell linker entry point

  mov	eax,'2'                      ;move 2 to eax register
  sub eax, '0'                     ;set 2 as a signed integer
  mov ebx, '3'                     ;move 3 to ebx register
  sub ebx, '0'                     ;set 3 as a signed integer
  add eax, ebx                     ;add ebx to eax
  add eax, '0'                     ;convert from decimal to ASCII to print
  ;
  mov [sum], eax                   ;set sum variable i.e. sum = eax
  mov	ecx,msg                      ;delacre msg as the message to write
  mov	edx, len                     ;set the message lenght
  mov	ebx,1	                       ;file descriptor (stdout)
  mov	eax,4	                       ;system call number (sys_write)
  int	0x80	                       ;call kernel
  ;
  mov	ecx,sum                      ;set sum as the message
  mov	edx, 1                       ;set lenght 1 for len when printing
  mov	ebx,1	                       ;file descriptor (stdout)
  mov	eax,4	                       ;system call number (sys_write)
  int	0x80	                       ;call kernel
  ;
  mov	eax,1	                       ;system call number (sys_exit)
  int	0x80	                       ;call kernel

section .data
   msg db "The sum is:", 0xA,0xD   ;print msg to line(0xA) & carrige return(0xD)
   len equ $ - msg                 ;the length of msg equates(equ) to len

segment .bss
   sum resb 1                      ;declare variable sum, reserving 4 byte's
