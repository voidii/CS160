  .extern allocate
insert:
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
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setle %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_0
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .left */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $0, %eax
  movl -16(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_1
  sub $4, %esp
  // ALLOCATE FOR NEW %tree
  pushl $3
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x0300000d, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  movl $0, 8(%eax)
  // END NEW %tree
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .left */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .left */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_1
IF_FALSE_1:
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .left */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of dummy */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_1:
  add $4, %esp
  jmp IF_END_0
IF_FALSE_0:
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .right */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $0, %eax
  movl -16(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_2
  sub $4, %esp
  // ALLOCATE FOR NEW %tree
  pushl $3
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x0300000d, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  movl $0, 8(%eax)
  // END NEW %tree
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .right */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .right */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_2
IF_FALSE_2:
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .right */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of dummy */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_2:
  add $4, %esp
IF_END_0:
  movl $0, %eax
  add $8, %esp
  movl %ebp, %esp
  pop %ebp
  ret
find:
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
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_3
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of retval */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_3
IF_FALSE_3:
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl -16(%ebp), %edx
  cmp %eax, %edx
  setl %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_4
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .left */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $0, %eax
  movl -16(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_5
  sub $4, %esp
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of retval */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_5
IF_FALSE_5:
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .left */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call find
  add $8, %esp
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of retval */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_5:
  add $4, %esp
  jmp IF_END_4
IF_FALSE_4:
  sub $4, %esp
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .right */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -16(%ebp)
  movl $0, %eax
  movl -16(%ebp), %edx
  cmp %eax, %edx
  sete %al
  movzbl %al, %eax
  cmp $0, %eax
  je IF_FALSE_6
  sub $4, %esp
  movl $0, %eax
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of retval */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
  jmp IF_END_6
IF_FALSE_6:
  sub $4, %esp
  movl %ebp, %eax
  sub $-12, %eax  /* load address of value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  movl %ebp, %eax
  sub $-8, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .right */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call find
  add $8, %esp
  movl %eax, -16(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of retval */
  movl -16(%ebp), %edx
  movl %edx, 0(%eax)
  add $4, %esp
IF_END_6:
  add $4, %esp
IF_END_4:
  add $4, %esp
IF_END_3:
  movl %ebp, %eax
  sub $12, %eax  /* load address of retval */
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
  pushl $0x00000003
  sub $16, %esp
  movl $0, -12(%ebp)
  movl $0, -16(%ebp)
  movl $0, -20(%ebp)
  // ALLOCATE FOR NEW %tree
  pushl $3
  call allocate
  add $4, %esp
  // SET TAG
  movl $0x0300000d, -4(%eax)
  // INITIALIZE FIELDS
  movl $0, 0(%eax)
  movl $0, 4(%eax)
  movl $0, 8(%eax)
  // END NEW %tree
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-42, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $42, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $21, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-21, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-84, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $84, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $4, %eax /* load address of field .left */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-42, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-21, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $-84, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $0, %eax
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $8, %eax /* load address of field .right */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $42, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $21, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $84, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call insert
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of dummy */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $42, %eax
  push %eax
  movl %ebp, %eax
  sub $12, %eax  /* load address of root */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  push %eax
  call find
  add $8, %esp
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of node */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of node */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .value */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  add $16, %esp
  movl %ebp, %esp
  pop %ebp
  ret
