  .extern allocate
foo:
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
  // ALLOCATE FOR NEW %list
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of bar */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %list
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of bar */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  add $8, %esp
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
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  // ALLOCATE FOR NEW %list
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of head */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %list
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of head */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_0:
  movl %ebp, %eax
  sub $16, %eax  /* load address of cntr */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $4, %eax
  movl -24(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_0
  sub $4, %esp
  call foo
  add $0, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of cntr */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $1, %eax
  movl -24(%ebp), %edx
  add %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of cntr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_0
WHILE_END_0:
  movl $42, %eax
  add $16, %esp
  movl %ebp, %esp
  pop %ebp
  ret
