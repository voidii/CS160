  .extern allocate
balancedTree:
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
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of depth */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_0
  sub $4, %esp
  // ALLOCATE FOR NEW %tree
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000007, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %tree
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of depth */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  push %eax
  call balancedTree
  add $4, %esp
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .left */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .left */
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
  je IF_FALSE_1
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .left */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .left */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .right */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_1
IF_FALSE_1:
  sub $0, %esp
  add $0, %esp
IF_END_1:
  add $4, %esp
  jmp IF_END_0
IF_FALSE_0:
  sub $0, %esp
  add $0, %esp
IF_END_0:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
size:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $12, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of tree */
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
  je IF_FALSE_2
  sub $4, %esp
  movl $1, %eax
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of tree */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .left */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call size
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -20(%ebp), %edx
  add %edx, %eax
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of tree */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .right */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call size
  add $4, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -20(%ebp), %edx
  add %edx, %eax
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_2
IF_FALSE_2:
  sub $0, %esp
  add $0, %esp
IF_END_2:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
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
  pushl $0x00000001
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
  movl $2, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_3:
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
  je WHILE_END_3
  sub $8, %esp
  movl %ebp, %eax
  sub $24, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $1, %eax
  movl -28(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  push %eax
  call balancedTree
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of tree */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of tree */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call size
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
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
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -32(%ebp)
  movl $1, %eax
  movl -32(%ebp), %edx
  add %edx, %eax
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $8, %esp
  jmp WHILE_START_3
WHILE_END_3:
  movl $10, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of counter */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_4:
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
  je WHILE_END_4
  sub $8, %esp
  movl %ebp, %eax
  sub $24, %eax  /* load address of counter */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $1, %eax
  movl -28(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  push %eax
  call balancedTree
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of tree */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of tree */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call size
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
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
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -32(%ebp)
  movl $1, %eax
  movl -32(%ebp), %edx
  add %edx, %eax
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $8, %esp
  jmp WHILE_START_4
WHILE_END_4:
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $20, %esp
  movl %ebp, %esp
  pop %ebp
  ret
