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
  pushl $3
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x03000009, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  movl $0, 8(%eax)
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
  add $8, %eax /* load address of field .children */
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
  add $8, %eax /* load address of field .children */
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
  add $8, %eax /* load address of field .children */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of m */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .children */
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
  add $8, %eax /* load address of field .children */
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
K:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000007
  // BODY
  sub $28, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call freshNodes
  add $4, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_7:
  movl %ebp, %eax
  sub $28, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_7
  sub $4, %esp
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of j */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $28, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call n
  add $8, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of u */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_8:
  movl %ebp, %eax
  sub $32, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_8
  sub $4, %esp
  movl %ebp, %eax
  sub $32, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call n
  add $8, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of v */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of u */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of v */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_9
  sub $4, %esp
  movl %ebp, %eax
  sub $20, %eax  /* load address of v */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of u */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call addEdge
  add $8, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of dummy */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_9
IF_FALSE_9:
  sub $0, %esp
  add $0, %esp
IF_END_9:
  movl %ebp, %eax
  sub $32, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  add %edx, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of j */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_8
WHILE_END_8:
  movl %ebp, %eax
  sub $28, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  add %edx, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of i */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_7
WHILE_END_7:
  movl %ebp, %eax
  sub $12, %eax  /* load address of nodes */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $28, %esp
  movl %ebp, %esp
  pop %ebp
  ret
dfs:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000033
  // BODY
  sub $28, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
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
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of graph */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_10:
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $0, %eax
  movl -36(%ebp), %edx
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
  sub $12, %eax  /* load address of todo */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of v */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $28, %eax  /* load address of v */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .mark */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $0, %eax
  movl -36(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_11
  sub $4, %esp
  movl $1, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of v */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .mark */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $28, %eax  /* load address of v */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .children */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of c */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_12:
  movl %ebp, %eax
  sub $32, %eax  /* load address of c */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $0, %eax
  movl -36(%ebp), %edx
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
  sub $32, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .mark */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $0, %eax
  movl -36(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_13
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $0, %eax
  movl -36(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_14
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
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_14
IF_FALSE_14:
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of todo */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $32, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .head */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call add
  add $8, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of dummy */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_14:
  add $4, %esp
  jmp IF_END_13
IF_FALSE_13:
  sub $0, %esp
  add $0, %esp
IF_END_13:
  movl %ebp, %eax
  sub $32, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .tail */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of c */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of nEdges */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  add %edx, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of nEdges */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_12
WHILE_END_12:
  add $4, %esp
  jmp IF_END_11
IF_FALSE_11:
  sub $0, %esp
  add $0, %esp
IF_END_11:
  add $4, %esp
  jmp WHILE_START_10
WHILE_END_10:
  movl %ebp, %eax
  sub $20, %eax  /* load address of nEdges */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $28, %esp
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
  pushl $0x00000002
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $4, %eax
  push %eax
  call K
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of g */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of g */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call dfs
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of total */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  add %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of total */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $5, %eax
  push %eax
  call K
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of g */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of g */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call dfs
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of total */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  add %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of total */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $4, %eax
  push %eax
  call K
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of g */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of g */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call dfs
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of total */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  add %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of total */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of total */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $16, %esp
  movl %ebp, %esp
  pop %ebp
  ret
