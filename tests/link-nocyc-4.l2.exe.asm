  .extern allocate
cell:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000001
  // BODY
  sub $8, %esp
  movl $0, -12(%ebp)
WHILE_START_0:
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of v */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_0
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of l */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of l */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of v */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of v */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_0
WHILE_END_0:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of l */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .col */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_1:
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-16, %eax  /* load address of u */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_1
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-16, %eax  /* load address of u */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-16, %eax  /* load address of u */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_1
WHILE_END_1:
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
set:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000001
  // BODY
  sub $8, %esp
  movl $0, -12(%ebp)
WHILE_START_2:
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of v */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_2
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of l */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of l */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of v */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of v */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_2
WHILE_END_2:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of l */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .col */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_3:
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-16, %eax  /* load address of u */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_3
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-16, %eax  /* load address of u */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-16, %eax  /* load address of u */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_3
WHILE_END_3:
  movl %ebp, %eax
  sub $-20, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of col */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
nCols:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $8, %esp
  movl $0, -12(%ebp)
WHILE_START_4:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of M */
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
  je WHILE_END_4
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of M */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of M */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  add %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_4
WHILE_END_4:
  movl %ebp, %eax
  sub $12, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
eye:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x0000000f
  // BODY
  sub $28, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of i */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_5:
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
  je WHILE_END_5
  sub $12, %esp
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of k */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %vec
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %vec
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of col */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of k */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -44(%ebp)
  movl $1, %eax
  movl -44(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl -40(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl -36(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_6
  sub $4, %esp
  movl $1, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of col */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_6
IF_FALSE_6:
  sub $0, %esp
  add $0, %esp
IF_END_6:
WHILE_START_7:
  movl %ebp, %eax
  sub $32, %eax  /* load address of k */
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
  sub $12, %esp
  movl %ebp, %eax
  sub $32, %eax  /* load address of k */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  add %edx, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of k */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %vec
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %vec
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of col2 */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of col */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of col2 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of col2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of col */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of col2 */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of k */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -44(%ebp)
  movl $1, %eax
  movl -44(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl -40(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl -36(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_8
  sub $4, %esp
  movl $1, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of col */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_8
IF_FALSE_8:
  sub $0, %esp
  add $0, %esp
IF_END_8:
  add $12, %esp
  jmp WHILE_START_7
WHILE_END_7:
  // ALLOCATE FOR NEW %mat
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000007, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %mat
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of col */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .col */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of col */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
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
  add $12, %esp
  jmp WHILE_START_5
WHILE_END_5:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $28, %esp
  movl %ebp, %esp
  pop %ebp
  ret
add:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000007
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $28, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of A */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call nCols
  add $4, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of n */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_9:
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_9
  sub $4, %esp
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_10:
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_10
  sub $4, %esp
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of A */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call cell
  add $12, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of a */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-12, %eax  /* load address of B */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call cell
  add $12, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of b */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  add %edx, %eax
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-16, %eax  /* load address of C */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call set
  add $16, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of dummy */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  add %edx, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_10
WHILE_END_10:
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  add %edx, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_9
WHILE_END_9:
  movl $0, %eax
  add $28, %esp
  movl %ebp, %esp
  pop %ebp
  ret
mul:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000007
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $32, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
  movl $0, -36(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of A */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call nCols
  add $4, %esp
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of n */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_11:
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -40(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_11
  sub $4, %esp
  movl $0, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_12:
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -40(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_12
  sub $4, %esp
  movl $0, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of k */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-16, %eax  /* load address of C */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call set
  add $16, %esp
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of dummy */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_13:
  movl %ebp, %eax
  sub $20, %eax  /* load address of k */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -40(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_13
  sub $4, %esp
  movl %ebp, %eax
  sub $20, %eax  /* load address of k */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of A */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call cell
  add $12, %esp
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of a */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $20, %eax  /* load address of k */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-12, %eax  /* load address of B */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call cell
  add $12, %esp
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of b */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-16, %eax  /* load address of C */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call cell
  add $12, %esp
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of dummy */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -40(%ebp), %edx
  imul %edx, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of dummy */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -40(%ebp), %edx
  add %edx, %eax
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-16, %eax  /* load address of C */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call set
  add $16, %esp
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of dummy */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of k */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $1, %eax
  movl -40(%ebp), %edx
  add %edx, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of k */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_13
WHILE_END_13:
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $1, %eax
  movl -40(%ebp), %edx
  add %edx, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of j */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_12
WHILE_END_12:
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $1, %eax
  movl -40(%ebp), %edx
  add %edx, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of i */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_11
WHILE_END_11:
  movl $0, %eax
  add $32, %esp
  movl %ebp, %esp
  pop %ebp
  ret
sum:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $8, %esp
  movl $0, -12(%ebp)
WHILE_START_14:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of v */
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
  je WHILE_END_14
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of sum */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of v */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  add %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of sum */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of v */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of v */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_14
WHILE_END_14:
  movl %ebp, %eax
  sub $12, %eax  /* load address of sum */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
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
  pushl $0x0000001f
  sub $36, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $0, -28(%ebp)
  movl $0, -32(%ebp)
  movl $0, -36(%ebp)
  movl $0, -40(%ebp)
  movl $4, %eax
  push %eax
  call eye
  add $4, %esp
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of I */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl $4, %eax
  push %eax
  call eye
  add $4, %esp
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of I2 */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of I2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of I */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of I */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call add
  add $12, %esp
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of dummy */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of I */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl $4, %eax
  push %eax
  call eye
  add $4, %esp
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of I4 */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of I4 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of I2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $16, %eax  /* load address of I2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call mul
  add $12, %esp
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of dummy */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of I2 */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %vec
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %vec
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of diag */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of i */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_15:
  movl %ebp, %eax
  sub $36, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -44(%ebp)
  movl $4, %eax
  movl -44(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_15
  sub $4, %esp
  movl %ebp, %eax
  sub $36, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $36, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $20, %eax  /* load address of I4 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call cell
  add $12, %esp
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of dummy */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %vec
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %vec
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of tmp */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of diag */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of tmp */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $28, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of diag */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of tmp */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of dummy */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of diag */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $36, %eax  /* load address of i */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -44(%ebp)
  movl $1, %eax
  movl -44(%ebp), %edx
  add %edx, %eax
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of i */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_15
WHILE_END_15:
  movl %ebp, %eax
  sub $24, %eax  /* load address of diag */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call sum
  add $4, %esp
  movl %eax, -44(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of dummy */
  movl -44(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of dummy */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $36, %esp
  movl %ebp, %esp
  pop %ebp
  ret
