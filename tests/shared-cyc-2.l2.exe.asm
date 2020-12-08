  .extern allocate
createCycle:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000007
  // BODY
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  // ALLOCATE FOR NEW %node
  pushl $1
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x01000003, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  // END NEW %node
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of head */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_0:
  movl $1, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_0
  sub $4, %esp
  // ALLOCATE FOR NEW %node
  pushl $1
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x01000003, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  // END NEW %node
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n2 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $1, %eax
  movl -24(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of size */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_0
WHILE_END_0:
  movl %ebp, %eax
  sub $12, %eax  /* load address of head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $16, %esp
  movl %ebp, %esp
  pop %ebp
  ret
  .globl Entry
  .type Entry, @function
Entry:
  // BOOTSTRAP ENTRY
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000001
  sub $12, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $4, %eax
  push %eax
  call createCycle
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl $5, %eax
  push %eax
  call createCycle
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl $6, %eax
  push %eax
  call createCycle
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl $5, %eax
  push %eax
  call createCycle
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl $3, %eax
  push %eax
  call createCycle
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl $6, %eax
  push %eax
  call createCycle
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl $42, %eax
  add $12, %esp
  movl %ebp, %esp
  pop %ebp
  ret
