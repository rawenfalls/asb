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
        
        mov [0x04EC], 0x0;buffer for even
        mov [0x04EA], 0x0 
         
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
            
            mov cx, [0x04F2]
            mov si, [0x04F2]
            sub cx, 1
            mov di, [0x04F6];sort odd
        w1: mov dx, [di]
            add di, 2
            mov ax, [di]
            cmp dx, ax
            jg swap             
        
        w0: loop w1
            sub si, 1
            cmp si, 0
            je sort_even
            mov cx,[0x04F2]
            sub cx, 1
            mov di, [0x04F6]
            jmp w0
    
        swap: mov [di], dx
              sub di,2
              mov [di], ax  
              add di,2
              jmp w0
       ;-----------------------------------------------       
 sort_even: mov cx, [0x04F4]
            mov si, [0x04F4]
            sub cx, 1
            mov di, [0x04F8];sort even
        w3: mov dx, [di]
            add di, 2
            mov ax, [di]
            mov [0x04EC], ax
            mov [0x04EA], dx
    getabs: neg ax
            js getabs
    getabs1:neg dx
            js getabs1        
            cmp dx, ax
            jl swap1             
        
        w2: loop w3
            sub si, 1
            cmp si, 0
            je finish
            mov cx,[0x04F4]
            sub cx, 1
            mov di, [0x04F8]
            jmp w2
    
        swap1:mov ax,[0x04EC]
              mov dx,[0x04EA]
              mov [di], dx
              sub di,2
              mov [di], ax  
              add di,2
              jmp w2      
              
                   
    
        finish:
    
    
    
    
;        cmp ax,0
;        js q6 
;        div [0x04F2]
;        jmp finish_count_mean 
;        q6:neg ax
;        div [0x04F2]
;        neg ax
;        finish_count_mean:mov [0x04F0], ax    