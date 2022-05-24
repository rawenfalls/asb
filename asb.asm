        mov cx, 13   
           
        mov [0x0500], 0x0006;6
        mov [0x0502], 0xFFFF;-1
        mov [0x0504], 0xFFFD;-3
        mov [0x0506], 0xFFFE;-2
        mov [0x0508], 0x0003;3
        mov [0x050A], 0x0004;4
        mov [0x050C], 0x0001;1
        mov [0x050E], 0xFFFB;-5
        mov [0x0510], 0x0005;5
        mov [0x0512], 0xFFFC;-4
        mov [0x0514], 0x0002;2
        ;mov [0x0516], 0xFFFA;-6
        mov [0x0516], 0xFFF9;-7 
        
        mov [0x04FC], 0x0500;start 
        
        mov [0x04FE], 0x0520;even
        mov [0x04FA], 0x0540;odd
        
        mov [0x04F8], 0x0520;sort even
        mov [0x04F6], 0x0540;sort odd
        
        mov [0x04F4], 0x0;count even
        mov [0x04F2], 0x0;count odd
        mov [0x04F0], 0x0;count arithmetic mean odd
        mov [0x04EE], 0x0 
         
        mov di, [0x04FC]
        mov dx, 0
        mov ax, 0
        
        jmp l1         
            
             
        l0: mov dx, [di]
            test dx,1
            jz even 
            mov si, 0x04FA
            add [0x04F2], 1
            add ax, dx 
            jmp p
        even:mov si, 0x04FE
            add [0x04F4], 1
           p:mov bx,[si] 
             mov [bx], dx
             add [si], 2
             add di, 2
            
        l1: loop l0         
        
            cwd
            mov cx,[0x04f2]   
            idiv cx
            mov [0x04F0],ax
            mov [0x04EE],dx
        
         
        
        final:
        
