  .extern allocate
makeList:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000003
  // BODY
  sub $12, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, %eax
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -20(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_0
  sub $4, %esp
  // ALLOCATE FOR NEW %list
  pushl $1
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x01000003, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  // END NEW %list
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of list */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl $1, %eax
  movl -20(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  push %eax
  call makeList
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of list */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .next */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_0
IF_FALSE_0:
  sub $0, %esp
  add $0, %esp
IF_END_0:
  movl %ebp, %eax
  sub $12, %eax  /* load address of list */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $12, %esp
  movl %ebp, %esp
  pop %ebp
  ret
min:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -12(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -12(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_1
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -12(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl -12(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_1
IF_FALSE_1:
  sub $0, %esp
  add $0, %esp
IF_END_1:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $4, %esp
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
  sub $20, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $10, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of n */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_2:
  movl %ebp, %eax
  sub $16, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_2
  sub $4, %esp
  movl $2, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  imul %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call min
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of size */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call makeList
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of l */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $1, %eax
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of counter */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_2
WHILE_END_2:
  movl %ebp, %eax
  sub $16, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $20, %esp
  movl %ebp, %esp
  pop %ebp
  ret
