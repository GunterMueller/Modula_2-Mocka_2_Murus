	.comm SuAlloc_s, 4
	.text
	.stabs "/usr/local/m2/src/mocka/",100,0,0,.LBB0
	.stabs "SuAlloc.mod",100,0,0,.LBB0
.LBB0:
	.stabs "BOOLEAN:t1=eTRUE:1,FALSE:0,;",0x80,0,0,0
	.stabs "CHAR:t2=r2;0;255;",0x80,0,0,0
	.stabs "SHORTCARD:t3=r3;0;65535;",0x80,0,0,0
	.stabs "LONGCARD:t4=r4;0;-1;",0x80,0,0,0
	.stabs "CARDINAL:t5=r5;0;-1;",0x80,0,0,0
	.stabs "SHORTINT:t6=r6;-32768;32767;",0x80,0,0,0
	.stabs "LONGINT:t7=r7;-2147483648;2147483647;",0x80,0,0,0
	.stabs "INTEGER:t8=r8;-2147483648;2147483647;",0x80,0,0,0
	.stabs "REAL:t9=r8;4;0;",0x80,0,0,0
	.stabs "LONGREAL:t10=r8;8;0;",0x80,0,0,0
	.stabs "BITSET:t11=r4;0;-1",0x80,0,0,0
	.stabs "WORD:t13=r13;0;255;",0x80,0,0,0
	.stabs "BYTE:t14=r2;0;255",0x80,0,0,0
	.stabs "VOID:t16=16",0x80,0,0,0
	.stabs "ADDRESS:t15=*16",0x80,0,0,0
	.stabs "PROC:t12=*f16;",0x80,0,0,0
	.globl	MemPools_KillPool
	.globl	MemPools_PoolAllocate
	.globl	MemPools_NewPool
	.globl	SuAlloc
	.globl	SuAlloc_InitAlloc
	.globl	SuAlloc_ALLOCATE
	.stabs "SuAlloc_InitAlloc:F16",36,0,0,SuAlloc_InitAlloc
	.align 4
SuAlloc_InitAlloc:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$.Lab1, %esp
.LN1:
	.stabn  68,0,23,.LN1-SuAlloc_InitAlloc		# line 23, column 3
.LBB1:
.LN2:
	.stabn  68,0,24,.LN2-SuAlloc_InitAlloc		# line 24, column 5
	leal	SuAlloc_s,%eax
	pushl	%eax
	call	MemPools_KillPool
	addl	$4, %esp
.LN3:
	.stabn  68,0,25,.LN3-SuAlloc_InitAlloc		# line 25, column 5
	leal	SuAlloc_s,%eax
	pushl	%eax
	call	MemPools_NewPool
	addl	$4, %esp
.LN4:
	.stabn  68,0,26,.LN4-SuAlloc_InitAlloc		# line 26, column 0
.LBE1:
	leave
	ret
	.Lab1 = 4
	.stabn 192,0,0,.LBB1-SuAlloc_InitAlloc
	.stabn 224,0,0,.LBE1-SuAlloc_InitAlloc
	.stabs "SuAlloc_ALLOCATE:F16",36,0,0,SuAlloc_ALLOCATE
	.align 4
SuAlloc_ALLOCATE:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$.Lab2, %esp
.LN5:
	.stabn  68,0,18,.LN5-SuAlloc_ALLOCATE		# line 18, column 3
.LBB2:
.LN6:
	.stabn  68,0,19,.LN6-SuAlloc_ALLOCATE		# line 19, column 5
	pushl	12(%ebp)
	pushl	8(%ebp)
	leal	SuAlloc_s,%eax
	pushl	%eax
	call	MemPools_PoolAllocate
	addl	$12, %esp
.LN7:
	.stabn  68,0,20,.LN7-SuAlloc_ALLOCATE		# line 20, column 0
.LBE2:
	leave
	ret
	.Lab2 = 4
	.stabs "size:p4",160,0,4,12
	.stabs "ptr:v15",160,0,4,8
	.stabn 192,0,0,.LBB2-SuAlloc_ALLOCATE
	.stabn 224,0,0,.LBE2-SuAlloc_ALLOCATE
	.stabs "SuAlloc:F16",36,0,0,SuAlloc
	.align 4
SuAlloc:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$.Lab3, %esp
.LN8:
	.stabn  68,0,28,.LN8-SuAlloc		# line 28, column 1
.LBB3:
.LN9:
	.stabn  68,0,29,.LN9-SuAlloc		# line 29, column 3
	leal	SuAlloc_s,%eax
	pushl	%eax
	call	MemPools_NewPool
	addl	$4, %esp
.LN10:
	.stabn  68,0,30,.LN10-SuAlloc		# line 30, column 0
.LBE3:
	leave
	ret
	.Lab3 = 4
	.stabs "MemPool:t17=15",128,0,0,0
	.stabn 192,0,0,.LBB3-SuAlloc
	.stabn 224,0,0,.LBE3-SuAlloc
	.stabs "SuAlloc_s:Gs4pool:17,0,32;;",32,0,0,0
