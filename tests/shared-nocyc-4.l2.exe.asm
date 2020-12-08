  .extern allocate
a:
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
  sub $-12, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -12(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_0
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -12(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl -12(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of n */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -12(%ebp)
  movl $1, %eax
  movl -12(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -12(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of n */
  movl -12(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_0
WHILE_END_0:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $4, %esp
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
  pushl $0x00000003
  // BODY
  sub $20, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_1:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
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
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
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
  movl -24(%ebp), %edx
  andl %edx, %eax
  cmp $0, %eax
  je WHILE_END_1
  sub $8, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of carry */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  add %edx, %eax
  movl -24(%ebp), %edx
  add %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  cmp %eax, %edx
  setle %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_2
  sub $4, %esp
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $2, %eax
  movl -24(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $1, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of carry */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_2
IF_FALSE_2:
  sub $4, %esp
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of carry */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_2:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $8, %esp
  jmp WHILE_START_1
WHILE_END_1:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $0, %eax
  movl -24(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_3
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_3
IF_FALSE_3:
  sub $0, %esp
  add $0, %esp
IF_END_3:
WHILE_START_4:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
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
  je WHILE_END_4
  sub $4, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of carry */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  add %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  cmp %eax, %edx
  setle %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_5
  sub $4, %esp
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $2, %eax
  movl -24(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $1, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of carry */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_5
IF_FALSE_5:
  sub $4, %esp
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of carry */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_5:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_4
WHILE_END_4:
  movl %ebp, %eax
  sub $20, %eax  /* load address of carry */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $1, %eax
  movl -24(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_6
  sub $4, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $1, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_6
IF_FALSE_6:
  sub $0, %esp
  add $0, %esp
IF_END_6:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $20, %esp
  movl %ebp, %esp
  pop %ebp
  ret
sub:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000003
  // LOCAL INFO
  pushl $0x00000007
  // BODY
  sub $20, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_7:
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
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
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of carry */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $0, %eax
  movl -28(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_8
  sub $4, %esp
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $2, %eax
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-1, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of carry */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_8
IF_FALSE_8:
  sub $4, %esp
  movl $0, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of carry */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_8:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of q */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_7
WHILE_END_7:
WHILE_START_9:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
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
  je WHILE_END_9
  sub $4, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of carry */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $0, %eax
  movl -28(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_10
  sub $4, %esp
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl $2, %eax
  movl -28(%ebp), %edx
  add %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-1, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of carry */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_10
IF_FALSE_10:
  sub $4, %esp
  movl $0, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of carry */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_10:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_9
WHILE_END_9:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call shrink
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $20, %esp
  movl %ebp, %esp
  pop %ebp
  ret
gt:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000003
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
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call size
  add $4, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call size
  add $4, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of sizeB */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of sizeB */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_11
  sub $4, %esp
  movl $1, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of result */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_11
IF_FALSE_11:
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of sizeB */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_12
  sub $4, %esp
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of result */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_12
IF_FALSE_12:
  sub $8, %esp
WHILE_START_13:
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of foundResult */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $0, %eax
  movl -40(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  movl -36(%ebp), %edx
  andl %edx, %eax
  cmp $0, %eax
  je WHILE_END_13
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call a
  add $8, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of digitA */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  push %eax
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call a
  add $8, %esp
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of digitB */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of digitB */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of digitA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_14
  sub $4, %esp
  movl $1, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of result */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl $1, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of foundResult */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_14
IF_FALSE_14:
  sub $4, %esp
  movl %ebp, %eax
  sub $28, %eax  /* load address of digitA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of digitB */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -36(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_15
  sub $4, %esp
  movl $0, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of result */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  movl $1, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of foundResult */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_15
IF_FALSE_15:
  sub $0, %esp
  add $0, %esp
IF_END_15:
  add $4, %esp
IF_END_14:
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -36(%ebp)
  movl $1, %eax
  movl -36(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -36(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of sizeA */
  movl -36(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_13
WHILE_END_13:
  add $8, %esp
IF_END_12:
  add $4, %esp
IF_END_11:
  movl %ebp, %eax
  sub $20, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $28, %esp
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
  sub $8, %esp
  movl $0, -12(%ebp)
WHILE_START_16:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
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
  je WHILE_END_16
  sub $4, %esp
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  add %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_16
WHILE_END_16:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
shrink:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000007
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
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl $1, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of isZero */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_17:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $0, %eax
  movl -40(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_17
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of alreadyShrunk */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $28, %eax  /* load address of sizeSoFar */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $1, %eax
  movl -40(%ebp), %edx
  add %edx, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $28, %eax  /* load address of sizeSoFar */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of alreadyShrunk */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $0, %eax
  movl -40(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_18
  sub $4, %esp
  movl %ebp, %eax
  sub $28, %eax  /* load address of sizeSoFar */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of actualSize */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $36, %eax  /* load address of isZero */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_18
IF_FALSE_18:
  sub $0, %esp
  add $0, %esp
IF_END_18:
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_17
WHILE_END_17:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $36, %eax  /* load address of isZero */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $1, %eax
  movl -40(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_19
  sub $4, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_19
IF_FALSE_19:
  sub $4, %esp
  movl %ebp, %eax
  sub $24, %eax  /* load address of alreadyShrunk */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $0, %eax
  movl -40(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_20
  sub $4, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_21:
  movl $0, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of actualSize */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -40(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_21
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of prev */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of current */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $32, %eax  /* load address of actualSize */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -40(%ebp)
  movl $1, %eax
  movl -40(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $32, %eax  /* load address of actualSize */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_21
WHILE_END_21:
  movl $0, %eax
  movl %eax, -40(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of prev */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -40(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_20
IF_FALSE_20:
  sub $0, %esp
  add $0, %esp
IF_END_20:
  add $4, %esp
IF_END_19:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $32, %esp
  movl %ebp, %esp
  pop %ebp
  ret
ge:
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
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call gt
  add $8, %esp
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of r */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of r */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_22
  sub $4, %esp
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of r */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_22
IF_FALSE_22:
  sub $4, %esp
  movl $1, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of r */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_22:
  movl %ebp, %eax
  sub $12, %eax  /* load address of r */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
gcd:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000003
  // LOCAL INFO
  pushl $0x00000002
  // BODY
  sub $12, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call ge
  add $8, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of aGeB */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of aGeB */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl $1, %eax
  movl -20(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_23
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call gcd
  add $8, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of result */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_23
IF_FALSE_23:
  sub $8, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl $0, %eax
  movl -20(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $0, %eax
  movl -24(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  movl -20(%ebp), %edx
  andl %edx, %eax
  cmp $0, %eax
  je IF_FALSE_24
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of result */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_24
IF_FALSE_24:
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call sub
  add $8, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-12, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call gcd
  add $8, %esp
  movl %eax, -20(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of result */
  movl -20(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_24:
  add $8, %esp
IF_END_23:
  movl %ebp, %eax
  sub $16, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $12, %esp
  movl %ebp, %esp
  pop %ebp
  ret
sff:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $0, %esp
  movl $0, %eax
  add $0, %esp
  movl %ebp, %esp
  pop %ebp
  ret
eval:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000001
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call size
  add $4, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_25:
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_25
  sub $4, %esp
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $1, %eax
  movl -24(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of size */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of p */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call a
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of a */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of x */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  imul %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  add %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_25
WHILE_END_25:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $16, %esp
  movl %ebp, %esp
  pop %ebp
  ret
div:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000000
  // BODY
  sub $8, %esp
  movl $0, -12(%ebp)
WHILE_START_26:
  movl %ebp, %eax
  sub $-12, %eax  /* load address of y */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of x */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setle %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_26
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of x */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of y */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  sub %eax, %edx
  movl %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of x */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $1, %eax
  movl -16(%ebp), %edx
  add %edx, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_26
WHILE_END_26:
  movl %ebp, %eax
  sub $12, %eax  /* load address of result */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
toPoly:
  // FUNCTION PROLOGUE
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000003
  // BODY
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of p */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of p */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
WHILE_START_27:
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of x */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je WHILE_END_27
  sub $4, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of x */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call div
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of halfX */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of halfX */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $2, %eax
  movl -24(%ebp), %edx
  imul %edx, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of x */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -24(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_28
  sub $4, %esp
  movl $1, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of c */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .coeff */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_28
IF_FALSE_28:
  sub $0, %esp
  add $0, %esp
IF_END_28:
  movl %ebp, %eax
  sub $20, %eax  /* load address of halfX */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of x */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp WHILE_START_27
WHILE_END_27:
  movl %ebp, %eax
  sub $12, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl $0, %eax
  movl -24(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_29
  sub $4, %esp
  // ALLOCATE FOR NEW %poly
  pushl $2
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x02000005, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  // END NEW %poly
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_29
IF_FALSE_29:
  sub $0, %esp
  add $0, %esp
IF_END_29:
  movl %ebp, %eax
  sub $12, %eax  /* load address of p */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .next */
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
  pushl $0x00000003
  sub $20, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  movl $0, -24(%ebp)
  movl $1, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $18, %eax
  push %eax
  call toPoly
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $24, %eax
  push %eax
  call toPoly
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of b */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call gcd
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call eval
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  imul %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $112, %eax
  push %eax
  call toPoly
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $21, %eax
  push %eax
  call toPoly
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of b */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call gcd
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call eval
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  imul %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $42, %eax
  push %eax
  call toPoly
  add $4, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of b */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call gcd
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl $2, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of a */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call eval
  add $8, %esp
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of tmp */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -28(%ebp), %edx
  imul %edx, %eax
  movl %eax, -28(%ebp)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl -28(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $24, %eax  /* load address of out */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $20, %esp
  movl %ebp, %esp
  pop %ebp
  ret
