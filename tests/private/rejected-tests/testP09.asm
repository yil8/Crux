.data                         # BEGIN Data Segment
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
                     # begin ast.DeclarationList(3,1)
                     # begin ast.FunctionDefinition(3,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(4,3)
                     # begin ast.Assignment(5,9)
                     # begin ast.AddressOf(5,7)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(5,7)[a]
                     # begin ast.Call(5,11)[Symbol(readInt:func(TypeList()):int)]
                     # begin ast.ExpressionList(5,21)
                     # end ast.ExpressionList(5,21)
                     # end arguments
jal func.readInt
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(5,11)[Symbol(readInt:func(TypeList()):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(5,9)
                     # begin ast.Dereference(6,7)
                     # begin ast.AddressOf(6,7)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(6,7)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(6,7)
                     # begin ast.LiteralInt(6,12)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(6,12)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
sne $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.1
                     # begin ast.StatementList(7,5)
                     # begin ast.Call(7,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(7,16)
                     # begin ast.Dereference(7,16)
                     # begin ast.AddressOf(7,16)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(7,16)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(7,16)
                     # end ast.ExpressionList(7,16)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(7,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(8,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(8,15)
                     # end ast.ExpressionList(8,15)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(8,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(9,12)[Symbol(main:func(TypeList()):void)]
                     # begin ast.ExpressionList(9,19)
                     # end ast.ExpressionList(9,19)
                     # end arguments
jal main
addi $sp, $sp, 0
                     # end ast.Call(9,12)[Symbol(main:func(TypeList()):void)]
j main.epilogue
                     # end ast.StatementList(7,5)
j label.0
label.1:
                     # begin ast.StatementList(11,3)
                     # end ast.StatementList(11,3)
label.0:
                     # begin ast.Call(11,3)[Symbol(printFloat:func(TypeList(float)):void)]
                     # begin ast.ExpressionList(11,16)
                     # begin ast.LiteralFloat(11,16)[99.9]
li.s $f0, 99.9
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(11,16)[99.9]
                     # end ast.ExpressionList(11,16)
                     # end arguments
jal func.printFloat
addi $sp, $sp, 4
                     # end ast.Call(11,3)[Symbol(printFloat:func(TypeList(float)):void)]
                     # end ast.StatementList(4,3)
main.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(3,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
