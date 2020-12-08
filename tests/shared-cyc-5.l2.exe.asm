  .extern allocate
  .globl Entry
  .type Entry, @function
Entry:
  // BOOTSTRAP ENTRY
  push %ebp
  movl %esp, %ebp
  // ARGUMENT INFO
  pushl $0x00000000
  // LOCAL INFO
  pushl $0x00000007
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
  sub $12, %eax  /* load address of n1 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $16, %eax  /* load address of n2 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $20, %eax  /* load address of n3 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $12, %eax  /* load address of n1 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $16, %eax  /* load address of n2 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $20, %eax  /* load address of n3 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $12, %eax  /* load address of n1 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $16, %eax  /* load address of n2 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $20, %eax  /* load address of n3 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $12, %eax  /* load address of n1 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $16, %eax  /* load address of n2 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
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
  sub $20, %eax  /* load address of n3 */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $16, %eax  /* load address of n2 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl %ebp, %eax
  sub $12, %eax  /* load address of n1 */
  movl 0(%eax), %eax/* dereference the address because we are not in lhs of an assignment */
  movl %eax, -24(%ebp)
  movl %ebp, %eax
  sub $20, %eax  /* load address of n3 */
  movl 0(%eax), %eax /* dereference the address at EAX */
  add $0, %eax /* load address of field .ptr */
  movl -24(%ebp), %edx
  movl %edx, 0(%eax)
  movl $3, %eax
  add $16, %esp
  movl %ebp, %esp
  pop %ebp
  ret
