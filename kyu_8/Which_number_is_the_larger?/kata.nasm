section        .text
global         whichIsLarger
whichIsLarger:               ; int whichIsLarger(int a, int b)
  ; start coding here
  mov   rax, rdi
  cmp   rdi, rsi
  cmovl rax, rsi

  ret
