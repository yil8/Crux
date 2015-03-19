.data                         # BEGIN Data Segment
cruxdata.c: .space 4
data.newline:      .asciiz       "\n"
data.floatquery:   .asciiz       "float?"
data.intquery:     .asciiz       "int?"
data.trueString:   .asciiz       "true"
data.falseString:  .asciiz       "false"
                              # END Data Segment
.text                         # BEGIN Code Segment
func.printBool:
lw $a0, 0($sp)
beqz $a0, label.printBool.loadFalse
la $a0, data.trueString
j label.printBool.join
label.printBool.loadFalse:
la $a0, data.falseString
label.printBool.join:
li   $v0, 4
syscall
jr $ra
func.printFloat:
l.s  $f12, 0($sp)
li   $v0,  2
syscall
jr $ra
func.printInt:
lw   $a0, 0($sp)
li   $v0, 1
syscall
jr $ra
func.println:
la   $a0, data.newline
li   $v0, 4
syscall
jr $ra
func.readFloat:
la   $a0, data.floatquery
li   $v0, 4
syscall
li   $v0, 6
syscall
mfc1 $v0, $f0
jr $ra
func.readInt:
la   $a0, data.intquery
li   $v0, 4
syscall
li   $v0, 5
syscall
jr $ra
                     # begin ast.DeclarationList(2,1)
                     # begin ast.FunctionDefinition(4,1)[Symbol(myAddTen:func(TypeList(int)):int)]
func.myAddTen:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(5,3)
                     # begin ast.Assignment(6,9)
                     # begin ast.AddressOf(6,7)[x]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(6,7)[x]
                     # begin ast.LiteralInt(6,11)[10]
li  $t1, 10
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(6,11)[10]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(6,9)
                     # begin ast.Dereference(7,10)
                     # begin ast.AddressOf(7,10)[a]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(7,10)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(7,10)
                     # begin ast.Dereference(7,14)
                     # begin ast.AddressOf(7,14)[x]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(7,14)[x]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(7,14)
lw   $t0, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
add $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.myAddTen.epilogue
                     # end ast.StatementList(5,3)
func.myAddTen.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(4,1)[Symbol(myAddTen:func(TypeList(int)):int)]
                     # begin ast.FunctionDefinition(10,1)[Symbol(myPrintTwo:func(TypeList(int, int)):void)]
func.myPrintTwo:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(11,3)
                     # begin ast.Assignment(12,9)
                     # begin ast.AddressOf(12,7)[x]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(12,7)[x]
                     # begin ast.Call(12,11)[Symbol(myAddTen:func(TypeList(int)):int)]
                     # begin ast.ExpressionList(12,22)
                     # begin ast.Dereference(12,22)
                     # begin ast.AddressOf(12,22)[b]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(12,22)[b]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(12,22)
                     # end ast.ExpressionList(12,22)
                     # end arguments
jal func.myAddTen
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(12,11)[Symbol(myAddTen:func(TypeList(int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(12,9)
                     # begin ast.Call(13,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(13,14)
                     # begin ast.Dereference(13,14)
                     # begin ast.AddressOf(13,14)[a]
addi $t0, $fp, 4
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(13,14)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(13,14)
                     # end ast.ExpressionList(13,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(13,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(14,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(14,14)
                     # begin ast.Dereference(14,14)
                     # begin ast.AddressOf(14,14)[x]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(14,14)[x]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(14,14)
                     # end ast.ExpressionList(14,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(14,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # end ast.StatementList(11,3)
func.myPrintTwo.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(10,1)[Symbol(myPrintTwo:func(TypeList(int, int)):void)]
                     # begin ast.FunctionDefinition(18,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(19,3)
                     # begin ast.Assignment(19,9)
                     # begin ast.AddressOf(19,7)[c]
la  $t0, cruxdata.c
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(19,7)[c]
                     # begin ast.LiteralInt(19,11)[2]
li  $t1, 2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(19,11)[2]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(19,9)
                     # begin ast.Call(20,3)[Symbol(myPrintTwo:func(TypeList(int, int)):void)]
                     # begin ast.ExpressionList(20,16)
                     # begin ast.LiteralInt(20,16)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(20,16)[1]
                     # begin ast.Dereference(20,19)
                     # begin ast.AddressOf(20,19)[c]
la  $t0, cruxdata.c
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(20,19)[c]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(20,19)
                     # end ast.ExpressionList(20,16)
                     # end arguments
jal func.myPrintTwo
addi $sp, $sp, 8
                     # end ast.Call(20,3)[Symbol(myPrintTwo:func(TypeList(int, int)):void)]
                     # begin ast.Call(21,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(21,13)
                     # end ast.ExpressionList(21,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(21,3)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(19,3)
main.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(18,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(2,1)
                              # END Code Segment
