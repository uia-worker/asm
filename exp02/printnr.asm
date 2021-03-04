.code
    mov ax,@DATA        ; get the address of the data segment
    mov ds,ax           ; store the address in the data segment register
;-----------------------
    mov eax,0FFFFFFFFh  ; 32 bit value (0 - FFFFFFFF) for example
;-----------------------
; convert the value in EAX to hexadecimal ASCIIs
;-----------------------
    mov di,OFFSET ASCII ; get the offset address
    mov cl,8            ; number of ASCII
P1: rol eax,4           ; 1 Nibble (start with highest byte)
    mov bl,al
    and bl,0Fh          ; only low-Nibble
    add bl,30h          ; convert to ASCII
    cmp bl,39h          ; above 9?
    jna short P2
    add bl,7            ; "A" to "F"
P2: mov [di],bl         ; store ASCII in buffer
    inc di              ; increase target address
    dec cl              ; decrease loop counter
    jnz P1              ; jump if cl is not equal 0 (zeroflag is not set)
;-----------------------
; Print string
;-----------------------
    mov dx,OFFSET ASCII ; DOS 1+ WRITE STRING TO STANDARD OUTPUT
    mov ah,9            ; DS:DX->'$'-terminated string
    int 21h             ; maybe redirected under DOS 2+ for output to file
                        ; (using pipe character">") or output to printer

  ; terminate program...

.data
ASCII DB "00000000",0Dh,0Ah,"$" ; buffer for ASCII string