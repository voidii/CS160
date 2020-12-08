  .extern allocate
bar:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000001
  // BODY
  sub $8, %esp
  movl $0, -12(%ebp)
  // ALLOCATE FOR NEW %bar
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000003, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %bar
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of ret */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of ret */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .quux */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of ret */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
foo:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000002
  // BODY
  sub $12, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  call bar
  add $0, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of y */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of y */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $12, %esp
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
  pushl $0x00000005
  sub $20, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $10, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of counter */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_0:
  movl $0, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
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
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of x */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %bar
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000003, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %bar
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of y */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of y */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  call foo
  add $0, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of y */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of out */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of y */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .quux */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of out */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $1, %eax
  movl -28(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of counter */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_0
WHILE_END_0:
  movl %ebp, %eax
  sub $16, %eax  /* load address of out */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $20, %esp
  movl %ebp, %esp
  pop %ebp
  ret
