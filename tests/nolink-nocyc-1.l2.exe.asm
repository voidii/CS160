  .extern allocate
  .globl Entry
  .type Entry, @function
Entry:
  // BOOTSTRAP ENTRY
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000003
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $10, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of counter */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_0:
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_0
  sub $4, %esp
  // ALLOCATE FOR NEW %foo
  pushl $1
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x01000001, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  // END NEW %foo
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of x */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %foo
  pushl $1
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x01000001, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  // END NEW %foo
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of y */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $1, %eax
  movl -24(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of counter */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_0
WHILE_END_0:
  movl $0, %eax
  add $16, %esp
  movl %ebp, %esp
  pop %ebp
  ret
