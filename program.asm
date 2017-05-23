global main
extern printf, malloc, strcpy, scanf, strlen, sscanf, sprintf, memcpy, strcmp
SECTION .text
@GlobalDeclaration:
    push                  rbp
     mov                  rbp,                  rsp
    push                  r14
    push                  r15
     sub                  rsp,                    0
@GlobalDeclaration.0.enter:
     mov       qword [@M - 0],                    0
@GlobalDeclaration.1.exit:
     add                  rsp,                    0
     pop                  r15
     pop                  r14
     pop                  rbp
     ret
main:
    push                  rbp
     mov                  rbp,                  rsp
    call   @GlobalDeclaration
    push                  r14
    push                  r15
     sub                  rsp,                  544
main.0.enter:
    push                  rcx
    push                  rdx
    push                  rbx
    push                  rsi
    push                  rdi
     sub                  rsp,                    8
    call               getInt
     add                  rsp,                    8
     pop                  rdi
     pop                  rsi
     pop                  rbx
     pop                  rdx
     pop                  rcx
     mov     qword [rbp - 24],                  rax
     mov                  r15,     qword [rbp - 24]
     mov       qword [@N - 0],                  r15
     mov                  r15,       qword [@N - 0]
     mov     qword [rbp - 32],                  r15
     add     qword [rbp - 32],                    5
     mov                  r15,     qword [rbp - 32]
     mov     qword [rbp - 40],                  r15
     add     qword [rbp - 40],                    1
     mov                  r15,     qword [rbp - 40]
    imul                  r15,                    8
     mov     qword [rbp - 40],                  r15
    push                  rcx
    push                  rdx
    push                  rbx
    push                  rsi
    push                  rdi
     mov                  rdi,     qword [rbp - 40]
     sub                  rsp,                    8
    call               malloc
     add                  rsp,                    8
     pop                  rdi
     pop                  rsi
     pop                  rbx
     pop                  rdx
     pop                  rcx
     mov     qword [rbp - 48],                  rax
     sub     qword [rbp - 40],                    8
     mov                  r14,     qword [rbp - 48]
     mov                  r15,     qword [rbp - 40]
     mov      qword [r14 - 0],                  r15
     add     qword [rbp - 48],                    8
     mov                  r15,     qword [rbp - 48]
     mov   qword [@check - 0],                  r15
     mov     qword [rbp - 56],                    0
     jmp main.2.loop_condition
main.1.loop_body:
     mov                  r15,     qword [rbp - 56]
     mov     qword [rbp - 64],                  r15
     add     qword [rbp - 56],                    1
     mov                  r15,     qword [rbp - 64]
     mov     qword [rbp - 72],                  r15
     mov                  r15,     qword [rbp - 72]
    imul                  r15,                    8
     mov     qword [rbp - 72],                  r15
     mov                  r15,   qword [@check - 0]
     mov     qword [rbp - 80],                  r15
     mov                  r15,     qword [rbp - 72]
     add     qword [rbp - 80],                  r15
     mov                  r14,     qword [rbp - 80]
     mov      qword [r14 - 0],                    1
     jmp main.2.loop_condition
main.2.loop_condition:
     mov                  r15,     qword [rbp - 56]
     cmp                  r15,       qword [@N - 0]
     mov                  r15,     qword [rbp - 88]
     mov                  r15,                    0
   setle                 r15b
     mov     qword [rbp - 88],                  r15
     cmp     qword [rbp - 88],                    1
      je     main.1.loop_body
     jmp     main.3.loop_exit
main.3.loop_exit:
     mov                  r15,       qword [@N - 0]
     mov     qword [rbp - 96],                  r15
     add     qword [rbp - 96],                    5
     mov                  r15,     qword [rbp - 96]
     mov    qword [rbp - 104],                  r15
     add    qword [rbp - 104],                    1
     mov                  r15,    qword [rbp - 104]
    imul                  r15,                    8
     mov    qword [rbp - 104],                  r15
    push                  rcx
    push                  rdx
    push                  rbx
    push                  rsi
    push                  rdi
     mov                  rdi,    qword [rbp - 104]
     sub                  rsp,                    8
    call               malloc
     add                  rsp,                    8
     pop                  rdi
     pop                  rsi
     pop                  rbx
     pop                  rdx
     pop                  rcx
     mov    qword [rbp - 112],                  rax
     sub    qword [rbp - 104],                    8
     mov                  r14,    qword [rbp - 112]
     mov                  r15,    qword [rbp - 104]
     mov      qword [r14 - 0],                  r15
     add    qword [rbp - 112],                    8
     mov                  r15,    qword [rbp - 112]
     mov    qword [rbp - 120],                  r15
     mov                  r15,       qword [@N - 0]
     mov    qword [rbp - 128],                  r15
     add    qword [rbp - 128],                    5
     mov                  r15,    qword [rbp - 128]
     mov    qword [rbp - 136],                  r15
     add    qword [rbp - 136],                    1
     mov                  r15,    qword [rbp - 136]
    imul                  r15,                    8
     mov    qword [rbp - 136],                  r15
    push                  rcx
    push                  rdx
    push                  rbx
    push                  rsi
    push                  rdi
     mov                  rdi,    qword [rbp - 136]
     sub                  rsp,                    8
    call               malloc
     add                  rsp,                    8
     pop                  rdi
     pop                  rsi
     pop                  rbx
     pop                  rdx
     pop                  rcx
     mov    qword [rbp - 144],                  rax
     sub    qword [rbp - 136],                    8
     mov                  r14,    qword [rbp - 144]
     mov                  r15,    qword [rbp - 136]
     mov      qword [r14 - 0],                  r15
     add    qword [rbp - 144],                    8
     mov                  r15,    qword [rbp - 144]
     mov    qword [rbp - 152],                  r15
     mov    qword [rbp - 160],                    1
     mov                  r15,    qword [rbp - 160]
    imul                  r15,                    8
     mov    qword [rbp - 160],                  r15
     mov                  r15,    qword [rbp - 120]
     mov    qword [rbp - 168],                  r15
     mov                  r15,    qword [rbp - 160]
     add    qword [rbp - 168],                  r15
     mov                  r14,    qword [rbp - 168]
     mov      qword [r14 - 0],                    1
     mov     qword [rbp - 56],                    2
     jmp main.25.loop_condition
main.4.loop_body:
     mov                  r15,     qword [rbp - 56]
     cmp                  r15,       qword [@N - 0]
     mov                  r15,    qword [rbp - 176]
     mov                  r15,                    0
    setg                 r15b
     mov    qword [rbp - 176],                  r15
     cmp    qword [rbp - 176],                    1
      je       main.5.if_true
     jmp      main.6.if_false
main.5.if_true:
     jmp    main.26.loop_exit
     jmp       main.7.if_exit
main.6.if_false:
     jmp       main.7.if_exit
main.7.if_exit:
     mov                  r15,     qword [rbp - 56]
     mov    qword [rbp - 184],                  r15
     mov                  r15,    qword [rbp - 184]
    imul                  r15,                    8
     mov    qword [rbp - 184],                  r15
     mov                  r15,   qword [@check - 0]
     mov    qword [rbp - 192],                  r15
     mov                  r15,    qword [rbp - 184]
     add    qword [rbp - 192],                  r15
     mov                  r14,    qword [rbp - 192]
     cmp      qword [r14 - 0],                    1
      je       main.8.if_true
     jmp      main.9.if_false
main.8.if_true:
     add       qword [@M - 0],                    1
     mov                  r15,       qword [@M - 0]
     mov    qword [rbp - 200],                  r15
     mov                  r15,    qword [rbp - 200]
    imul                  r15,                    8
     mov    qword [rbp - 200],                  r15
     mov                  r15,    qword [rbp - 152]
     mov    qword [rbp - 208],                  r15
     mov                  r15,    qword [rbp - 200]
     add    qword [rbp - 208],                  r15
     mov                  r14,    qword [rbp - 208]
     mov                  r15,     qword [rbp - 56]
     mov      qword [r14 - 0],                  r15
     mov                  r15,     qword [rbp - 56]
     mov    qword [rbp - 216],                  r15
     mov                  r15,    qword [rbp - 216]
    imul                  r15,                    8
     mov    qword [rbp - 216],                  r15
     mov                  r15,    qword [rbp - 120]
     mov    qword [rbp - 224],                  r15
     mov                  r15,    qword [rbp - 216]
     add    qword [rbp - 224],                  r15
     mov                  r15,     qword [rbp - 56]
     mov    qword [rbp - 232],                  r15
     sub    qword [rbp - 232],                    1
     mov                  r14,    qword [rbp - 224]
     mov                  r15,    qword [rbp - 232]
     mov      qword [r14 - 0],                  r15
     jmp      main.10.if_exit
main.9.if_false:
     jmp      main.10.if_exit
main.10.if_exit:
     mov                  r15,     qword [rbp - 56]
     mov    qword [rbp - 240],                  r15
     mov    qword [rbp - 248],                    1
     jmp main.19.loop_condition
main.11.loop_body:
     mov                  r15,    qword [rbp - 248]
     mov    qword [rbp - 256],                  r15
     mov                  r15,    qword [rbp - 256]
    imul                  r15,                    8
     mov    qword [rbp - 256],                  r15
     mov                  r15,    qword [rbp - 152]
     mov    qword [rbp - 264],                  r15
     mov                  r15,    qword [rbp - 256]
     add    qword [rbp - 264],                  r15
     mov                  r15,    qword [rbp - 240]
     mov    qword [rbp - 272],                  r15
     mov                  r14,    qword [rbp - 264]
     mov                  r15,    qword [rbp - 272]
    imul                  r15,      qword [r14 - 0]
     mov    qword [rbp - 272],                  r15
     mov                  r15,    qword [rbp - 272]
     mov    qword [rbp - 280],                  r15
     mov                  r15,    qword [rbp - 280]
     cmp                  r15,       qword [@N - 0]
     mov                  r15,    qword [rbp - 288]
     mov                  r15,                    0
    setg                 r15b
     mov    qword [rbp - 288],                  r15
     cmp    qword [rbp - 288],                    1
      je      main.12.if_true
     jmp     main.13.if_false
main.12.if_true:
     jmp main.18.loop_increment
     jmp      main.14.if_exit
main.13.if_false:
     jmp      main.14.if_exit
main.14.if_exit:
     mov                  r15,    qword [rbp - 280]
     mov    qword [rbp - 296],                  r15
     mov                  r15,    qword [rbp - 296]
    imul                  r15,                    8
     mov    qword [rbp - 296],                  r15
     mov                  r15,   qword [@check - 0]
     mov    qword [rbp - 304],                  r15
     mov                  r15,    qword [rbp - 296]
     add    qword [rbp - 304],                  r15
     mov                  r14,    qword [rbp - 304]
     mov      qword [r14 - 0],                    0
     mov                  r15,    qword [rbp - 248]
     mov    qword [rbp - 312],                  r15
     mov                  r15,    qword [rbp - 312]
    imul                  r15,                    8
     mov    qword [rbp - 312],                  r15
     mov                  r15,    qword [rbp - 152]
     mov    qword [rbp - 320],                  r15
     mov                  r15,    qword [rbp - 312]
     add    qword [rbp - 320],                  r15
     mov                  r15,    qword [rbp - 240]
     mov    qword [rbp - 328],                  r15
     mov                  r14,    qword [rbp - 320]
     mov                  rax,    qword [rbp - 328]
     mov                  r15,      qword [r14 - 0]
     mov                  rdx,                    0
     cqo
    idiv                  r15
     mov    qword [rbp - 328],                  rdx
     cmp    qword [rbp - 328],                    0
     mov                  r15,    qword [rbp - 336]
     mov                  r15,                    0
    sete                 r15b
     mov    qword [rbp - 336],                  r15
     cmp    qword [rbp - 336],                    1
      je      main.15.if_true
     jmp     main.16.if_false
main.15.if_true:
     mov                  r15,    qword [rbp - 280]
     mov    qword [rbp - 344],                  r15
     mov                  r15,    qword [rbp - 344]
    imul                  r15,                    8
     mov    qword [rbp - 344],                  r15
     mov                  r15,    qword [rbp - 120]
     mov    qword [rbp - 352],                  r15
     mov                  r15,    qword [rbp - 344]
     add    qword [rbp - 352],                  r15
     mov                  r15,    qword [rbp - 240]
     mov    qword [rbp - 360],                  r15
     mov                  r15,    qword [rbp - 360]
    imul                  r15,                    8
     mov    qword [rbp - 360],                  r15
     mov                  r15,    qword [rbp - 120]
     mov    qword [rbp - 368],                  r15
     mov                  r15,    qword [rbp - 360]
     add    qword [rbp - 368],                  r15
     mov                  r15,    qword [rbp - 248]
     mov    qword [rbp - 376],                  r15
     mov                  r15,    qword [rbp - 376]
    imul                  r15,                    8
     mov    qword [rbp - 376],                  r15
     mov                  r15,    qword [rbp - 152]
     mov    qword [rbp - 384],                  r15
     mov                  r15,    qword [rbp - 376]
     add    qword [rbp - 384],                  r15
     mov                  r14,    qword [rbp - 368]
     mov                  r15,      qword [r14 - 0]
     mov    qword [rbp - 392],                  r15
     mov                  r14,    qword [rbp - 384]
     mov                  r15,    qword [rbp - 392]
    imul                  r15,      qword [r14 - 0]
     mov    qword [rbp - 392],                  r15
     mov                  r14,    qword [rbp - 352]
     mov                  r15,    qword [rbp - 392]
     mov      qword [r14 - 0],                  r15
     jmp    main.23.loop_exit
     jmp      main.17.if_exit
main.16.if_false:
     mov                  r15,    qword [rbp - 248]
     mov    qword [rbp - 400],                  r15
     mov                  r15,    qword [rbp - 400]
    imul                  r15,                    8
     mov    qword [rbp - 400],                  r15
     mov                  r15,    qword [rbp - 152]
     mov    qword [rbp - 408],                  r15
     mov                  r15,    qword [rbp - 400]
     add    qword [rbp - 408],                  r15
     mov                  r15,    qword [rbp - 240]
     mov    qword [rbp - 416],                  r15
     mov                  r14,    qword [rbp - 408]
     mov                  r15,    qword [rbp - 416]
    imul                  r15,      qword [r14 - 0]
     mov    qword [rbp - 416],                  r15
     mov                  r15,    qword [rbp - 416]
     mov    qword [rbp - 424],                  r15
     mov                  r15,    qword [rbp - 424]
    imul                  r15,                    8
     mov    qword [rbp - 424],                  r15
     mov                  r15,    qword [rbp - 120]
     mov    qword [rbp - 432],                  r15
     mov                  r15,    qword [rbp - 424]
     add    qword [rbp - 432],                  r15
     mov                  r15,    qword [rbp - 240]
     mov    qword [rbp - 440],                  r15
     mov                  r15,    qword [rbp - 440]
    imul                  r15,                    8
     mov    qword [rbp - 440],                  r15
     mov                  r15,    qword [rbp - 120]
     mov    qword [rbp - 448],                  r15
     mov                  r15,    qword [rbp - 440]
     add    qword [rbp - 448],                  r15
     mov                  r15,    qword [rbp - 248]
     mov    qword [rbp - 456],                  r15
     mov                  r15,    qword [rbp - 456]
    imul                  r15,                    8
     mov    qword [rbp - 456],                  r15
     mov                  r15,    qword [rbp - 152]
     mov    qword [rbp - 464],                  r15
     mov                  r15,    qword [rbp - 456]
     add    qword [rbp - 464],                  r15
     mov                  r14,    qword [rbp - 464]
     mov                  r15,      qword [r14 - 0]
     mov    qword [rbp - 472],                  r15
     sub    qword [rbp - 472],                    1
     mov                  r14,    qword [rbp - 448]
     mov                  r15,      qword [r14 - 0]
     mov    qword [rbp - 480],                  r15
     mov                  r15,    qword [rbp - 480]
    imul                  r15,    qword [rbp - 472]
     mov    qword [rbp - 480],                  r15
     mov                  r14,    qword [rbp - 432]
     mov                  r15,    qword [rbp - 480]
     mov      qword [r14 - 0],                  r15
     jmp      main.17.if_exit
main.17.if_exit:
     jmp main.18.loop_increment
main.18.loop_increment:
     mov                  r15,    qword [rbp - 248]
     mov    qword [rbp - 488],                  r15
     add    qword [rbp - 248],                    1
     jmp main.19.loop_condition
main.19.loop_condition:
     mov                  r15,    qword [rbp - 248]
     cmp                  r15,       qword [@M - 0]
     mov                  r15,    qword [rbp - 496]
     mov                  r15,                    0
   setle                 r15b
     mov    qword [rbp - 496],                  r15
     cmp    qword [rbp - 496],                    1
      je main.21.logical_true
     jmp main.20.logical_false
main.20.logical_false:
     mov    qword [rbp - 504],                    0
     jmp main.22.logical_exit
main.21.logical_true:
     mov                  r15,    qword [rbp - 248]
     mov    qword [rbp - 512],                  r15
     mov                  r15,    qword [rbp - 512]
    imul                  r15,                    8
     mov    qword [rbp - 512],                  r15
     mov                  r15,    qword [rbp - 152]
     mov    qword [rbp - 520],                  r15
     mov                  r15,    qword [rbp - 512]
     add    qword [rbp - 520],                  r15
     mov                  r15,    qword [rbp - 240]
     mov    qword [rbp - 528],                  r15
     mov                  r14,    qword [rbp - 520]
     mov                  r15,    qword [rbp - 528]
    imul                  r15,      qword [r14 - 0]
     mov    qword [rbp - 528],                  r15
     mov                  r15,    qword [rbp - 528]
     cmp                  r15,       qword [@N - 0]
     mov                  r15,    qword [rbp - 536]
     mov                  r15,                    0
   setle                 r15b
     mov    qword [rbp - 536],                  r15
     mov                  r15,    qword [rbp - 536]
     mov    qword [rbp - 504],                  r15
     jmp main.22.logical_exit
main.22.logical_exit:
     cmp    qword [rbp - 504],                    1
      je    main.11.loop_body
     jmp    main.23.loop_exit
main.23.loop_exit:
     mov                  r15,    qword [rbp - 240]
     mov    qword [rbp - 544],                  r15
     mov                  r15,    qword [rbp - 544]
    imul                  r15,                    8
     mov    qword [rbp - 544],                  r15
     mov                  r15,    qword [rbp - 120]
     mov    qword [rbp - 552],                  r15
     mov                  r15,    qword [rbp - 544]
     add    qword [rbp - 552],                  r15
    push                  rcx
    push                  rdx
    push                  rbx
    push                  rsi
    push                  rdi
     mov                  r14,    qword [rbp - 552]
     mov                  rdi,      qword [r14 - 0]
     sub                  rsp,                    8
    call             toString
     add                  rsp,                    8
     pop                  rdi
     pop                  rsi
     pop                  rbx
     pop                  rdx
     pop                  rcx
     mov    qword [rbp - 560],                  rax
    push                  rcx
    push                  rdx
    push                  rbx
    push                  rsi
    push                  rdi
     mov                  rdi,    qword [rbp - 560]
     sub                  rsp,                    8
    call              println
     add                  rsp,                    8
     pop                  rdi
     pop                  rsi
     pop                  rbx
     pop                  rdx
     pop                  rcx
     jmp main.24.loop_increment
main.24.loop_increment:
     add     qword [rbp - 56],                    1
     jmp main.25.loop_condition
main.25.loop_condition:
     mov                  r15,                    1
     cmp                  r15,                    1
      je     main.4.loop_body
     jmp    main.26.loop_exit
main.26.loop_exit:
     mov                  rax,                    0
     jmp         main.27.exit
main.27.exit:
     add                  rsp,                  544
     pop                  r15
     pop                  r14
     pop                  rbp
     ret
printInt:
     mov                  rsi,                  rdi
     mov                  rdi,     __printIntFormat
     sub                  rsp,                    8
    call               printf
     add                  rsp,                    8
     ret
print:
     mov                  rsi,                  rdi
     mov                  rdi,        __printFormat
     sub                  rsp,                    8
    call               printf
     add                  rsp,                    8
     ret
println:
     mov                  rsi,                  rdi
     mov                  rdi,      __printlnFormat
     sub                  rsp,                    8
    call               printf
     add                  rsp,                    8
     ret
getInt:
     mov                  rdi,       __getIntFormat
     mov                  rsi,           @getIntBuf
     sub                  rsp,                    8
    call                scanf
     add                  rsp,                    8
     mov                  rax,   qword [@getIntBuf]
     ret
getString:
    push                  r15
     mov                  rdi,                  300
    call               malloc
     mov                  r15,                  rax
     add                  r15,                    8
     mov                  rdi,    __getStringFormat
     mov                  rsi,                  r15
    call                scanf
     mov                  rdi,                  r15
    call               strlen
     mov      qword [r15 - 8],                  rax
     mov                  rax,                  r15
     pop                  r15
     ret
toString:
    push                  r15
    push                  rdi
     mov                  rdi,                   20
     sub                  rsp,                    8
    call               malloc
     add                  rsp,                    8
     mov                  r15,                  rax
     add                  r15,                    8
     mov                  rdi,                  r15
     mov                  rsi,     __toStringFormat
     pop                  rdx
    call              sprintf
     mov                  rdi,                  r15
    call               strlen
     mov      qword [r15 - 8],                  rax
     mov                  rax,                  r15
     pop                  r15
     ret
__array_size:
     mov                  rax,      qword [rdi - 8]
     ret
__string_length:
     mov                  rax,      qword [rdi - 8]
     ret
__string_parseInt:
     mov                  rsi,       __getIntFormat
     mov                  rdx,         @parseIntBuf
     sub                  rsp,                    8
    call               sscanf
     add                  rsp,                    8
     mov                  rax, qword [@parseIntBuf]
     ret
__string_substring:
    push                  r15
    push                  r14
     mov                  r15,                  rdi
     add                  r15,                  rsi
     mov                  r14,                  rdx
     sub                  r14,                  rsi
     add                  r14,                    1
     mov                  rdi,                  r14
     add                  rdi,                    9
     sub                  rsp,                    8
    call               malloc
     add                  rsp,                    8
     add                  rax,                    8
     mov                  rdi,                  rax
     mov                  rsi,                  r15
     mov                  rdx,                  r14
     sub                  rsp,                    8
    call               memcpy
     add                  rsp,                    8
     mov      qword [rax - 8],                  r14
     mov                  r15,                  rax
     add                  r15,                  r14
     mov                  r15,                    0
     pop                  r14
     pop                  r15
     ret
__string_ord:
     add                  rdi,                  rsi
   movsx                  rax,           byte [rdi]
     ret
__string_connection:
    push                  r15
    push                  r14
    push                  r13
     mov                  r15,      qword [rdi - 8]
     add                  r15,      qword [rsi - 8]
     add                  r15,                    9
     mov                  r14,                  rdi
     mov                  r13,                  rsi
     mov                  rdi,                  r15
    call               malloc
     sub                  r15,                    9
     mov          qword [rax],                  r15
     mov                  r15,                  rax
     add                  r15,                    8
     mov                  rdi,                  r15
     mov                  rsi,                  r14
    call               strcpy
     add                  r15,      qword [r14 - 8]
     mov                  r14,                  rax
     mov                  rdi,                  r15
     mov                  rsi,                  r13
    call               strcpy
     mov                  rax,                  r14
     pop                  r13
     pop                  r14
     pop                  r15
     ret
__string_EQ:
     sub                  rsp,                    8
    call               strcmp
     add                  rsp,                    8
     cmp                  eax,                    0
     mov                  rax,                    0
    sete                   al
     ret
__string_NEQ:
     sub                  rsp,                    8
    call               strcmp
     add                  rsp,                    8
     cmp                  eax,                    0
     mov                  rax,                    0
   setne                   al
     ret
__string_GR:
     sub                  rsp,                    8
    call               strcmp
     add                  rsp,                    8
     cmp                  eax,                    0
     mov                  rax,                    0
    setg                   al
     ret
__string_GREQ:
     sub                  rsp,                    8
    call               strcmp
     add                  rsp,                    8
     cmp                  eax,                    0
     mov                  rax,                    0
   setge                   al
     ret
__string_LE:
     sub                  rsp,                    8
    call               strcmp
     add                  rsp,                    8
     cmp                  eax,                    0
     mov                  rax,                    0
    setl                   al
     ret
__string_LEEQ:
     sub                  rsp,                    8
    call               strcmp
     add                  rsp,                    8
     cmp                  eax,                    0
     mov                  rax,                    0
   setle                   al
     ret
SECTION .data
__printIntFormat:
      db         "%ld", 10, 0
__printFormat:
      db              "%s", 0
__printlnFormat:
      db          "%s", 10, 0
__getIntFormat:
      db             "%ld", 0
__getStringFormat:
      db              "%s", 0
__toStringFormat:
      db             "%ld", 0
__parseIntFormat:
      db             "%ld", 0
SECTION .bss
@N:
    resq                    1
@M:
    resq                    1
@check:
    resq                    1
@getIntBuf:
    resq                    1
@parseIntBuf:
    resq                    1
