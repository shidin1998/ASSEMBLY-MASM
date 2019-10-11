;program for leniar search
        print macro msg
        mov dx,offset msg
        mov ah,09h
        int 21h
endm

data segment
        res dw 10 dup(?)
        arr dw 10 dup(?)
        n1 dw 00h
        n2 dw 00h
        et dw 00h
        msg1 db "Enter the limit:$"
        msg2 db 10d,13d, "enter the number:$"
        msg3 db 10d,13d,"enter the key:$"
        msg4 db 10d,13d, "element found:$"
        msg5 db 10d,13d, "element not found:$"
        msg6 db 10d,13d,"position at:$"
       hhh
       shidin 
data ends
assume cs:code,ds:data
code segment
   read:mov bx,0ah
        mov cx,00h
     l1:mov ah,01h
          int 21h
          cmp al,0dh
          jz exit
          mov ah,00h
          sub al,30h
          push ax
          mov ax,cx
          mul bx
          mov cx,ax
          pop ax
          add cx,ax
          jmp l1
     exit:ret
     disp: mov di,offset res
           mov bx,0ah
           mov cx,00h
           mov dx,24h
           push dx
           inc cx
        l2:mov dx,0000h
           div bx
           add dx,30h
           push dx
           inc cx
           cmp ax,00h
           jnz l2
        l3:pop [di]
           inc di
           loop l3
           ret
     start:mov ax,data
           mov ds,ax
           print msg1
           call read
           mov n1,cx
           mov n2,cx
           print msg2
           mov si,offset arr
       lp: call read
           mov [si],cx
           inc si
           inc si
           dec n1
           jnz lp
           print msg3
           call read
           mov si,offset arr
       lp1:cmp [si],cx
           jz found
           inc et
           inc si
           inc si
           dec n2
           jnz lp1
           jmp nfound
     found:print msg4
           print msg6
           mov ah,00h
           mov ax,et
           call disp
           print res
           jmp exit1
    nfound:print msg5
           jmp exit1
     exit1:mov ah,4ch
           int 21h
code ends
end start
   
