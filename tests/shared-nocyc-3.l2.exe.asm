  .extern allocate
n:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $4, %esp
WHILE_START_0:
  movl $0, %eax
  movl %eax, -12(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -12(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_0
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of nodes */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -12(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of nodes */
  movl -12(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -12(%ebp)
  movl $1, %eax
  movl -12(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -12(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of i */
  movl -12(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_0
WHILE_END_0:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of nodes */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $4, %esp
  movl %ebp, %esp
  pop %ebp
  ret
freshNodes:
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
WHILE_START_1:
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
  je WHILE_END_1
  sub $4, %esp
  // ALLOCATE FOR NEW %list
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000007, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of l */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of l */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %node
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %node
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of l */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
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
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_1
WHILE_END_1:
  movl %ebp, %eax
  sub $12, %eax  /* load address of l */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $12, %esp
  movl %ebp, %esp
  pop %ebp
  ret
add:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000003
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
  movl $0x02000007, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of t */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of list */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of t */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of list */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of t */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of list */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of t */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of list */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
addEdge:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000003
  // LOCAL INFO
  pushl $0x00000001
  // BODY
  sub $12, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_2:
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl $0, %eax
  movl -20(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_2
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of m */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -20(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_3
  sub $4, %esp
  movl $1, %eax
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of exists */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_3
IF_FALSE_3:
  sub $0, %esp
  add $0, %esp
IF_END_3:
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_2
WHILE_END_2:
  movl %ebp, %eax
  sub $16, %eax  /* load address of exists */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl $0, %eax
  movl -20(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_4
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl $0, %eax
  movl -20(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_5
  sub $4, %esp
  // ALLOCATE FOR NEW %list
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000007, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of m */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_5
IF_FALSE_5:
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-12, %eax  /* load address of m */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call add
  add $8, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of exists */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_5:
  add $4, %esp
  jmp IF_END_4
IF_FALSE_4:
  sub $0, %esp
  add $0, %esp
IF_END_4:
  movl $0, %eax
  add $12, %esp
  movl %ebp, %esp
  pop %ebp
  ret
appendR:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000003
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $8, %esp
  movl $0, -12(%ebp)
WHILE_START_6:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of source */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $0, %eax
  movl -16(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_6
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of target */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of source */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call add
  add $8, %esp
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of dummy */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of source */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of source */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_6
WHILE_END_6:
  movl %ebp, %eax
  sub $12, %eax  /* load address of dummy */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
descendants:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000007
  // BODY
  sub $20, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_7:
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $0, %eax
  movl -28(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_7
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $0, %eax
  movl -28(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_8
  sub $4, %esp
  // ALLOCATE FOR NEW %list
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000007, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %list
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_8
IF_FALSE_8:
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call add
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of dummy */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_8:
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call descendants
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of rec */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $20, %eax  /* load address of rec */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call appendR
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of dummy */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_7
WHILE_END_7:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $20, %esp
  movl %ebp, %esp
  pop %ebp
  ret
transitiveClosure:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000003
  // BODY
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_9:
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $0, %eax
  movl -24(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_9
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call transitiveClosure
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of c */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_9
WHILE_END_9:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call descendants
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of r */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_10:
  movl %ebp, %eax
  sub $16, %eax  /* load address of r */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $0, %eax
  movl -24(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_10
  sub $4, %esp
  movl %ebp, %eax
  sub $16, %eax  /* load address of r */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call addEdge
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of r */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of r */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_10
WHILE_END_10:
  movl $0, %eax
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
  pushl $0x0000013f
  sub $40, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
  movl $0, -36(%ebp)
  movl $0, -40(%ebp)
  movl $0, -44(%ebp)
  movl $5, %eax
  push %eax
  call freshNodes
  add $4, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call n
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n0 */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl $1, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call n
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n1 */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call n
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of n2 */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl $3, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call n
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of n3 */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl $4, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call n
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of n4 */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n1 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of n0 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call addEdge
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $40, %eax  /* load address of dummy */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of n0 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call addEdge
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $40, %eax  /* load address of dummy */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $28, %eax  /* load address of n3 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $20, %eax  /* load address of n1 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call addEdge
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $40, %eax  /* load address of dummy */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $28, %eax  /* load address of n3 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $24, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call addEdge
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $40, %eax  /* load address of dummy */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of n4 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $28, %eax  /* load address of n3 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call addEdge
  add $8, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $40, %eax  /* load address of dummy */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call transitiveClosure
  add $4, %esp
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $40, %eax  /* load address of dummy */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_11:
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -48(%ebp)
  movl $0, %eax
  movl -48(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_11
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .children */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $44, %eax  /* load address of c */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_12:
  movl %ebp, %eax
  sub $44, %eax  /* load address of c */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -48(%ebp)
  movl $0, %eax
  movl -48(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_12
  sub $4, %esp
  movl %ebp, %eax
  sub $36, %eax  /* load address of edgeCount */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -48(%ebp)
  movl $1, %eax
  movl -48(%ebp), %edx
  add %edx, %eax
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of edgeCount */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $44, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $44, %eax  /* load address of c */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_12
WHILE_END_12:
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -48(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl -48(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_11
WHILE_END_11:
  movl %ebp, %eax
  sub $36, %eax  /* load address of edgeCount */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $40, %esp
  movl %ebp, %esp
  pop %ebp
  ret
