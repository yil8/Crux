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
                     # begin ast.FunctionDefinition(3,1)[Symbol(badRandom:func(TypeList()):int)]
func.badRandom:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(4,3)
                     # begin ast.LiteralInt(4,10)[4]
li  $t1, 4
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(4,10)[4]
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.badRandom.epilogue
                     # end ast.StatementList(4,3)
func.badRandom.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(3,1)[Symbol(badRandom:func(TypeList()):int)]
                     # begin ast.FunctionDefinition(7,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 8
                     # begin ast.StatementList(8,3)
                     # begin ast.Assignment(9,13)
                     # begin ast.AddressOf(9,7)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(9,7)[outer]
                     # begin ast.LiteralInt(9,15)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(9,15)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(9,13)
label.0:
                     # begin ast.Dereference(10,10)
                     # begin ast.AddressOf(10,10)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,10)[outer]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,10)
                     # begin ast.LiteralInt(10,18)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(10,18)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
slt $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.1
                     # begin ast.StatementList(15,5)
                     # begin ast.Assignment(16,15)
                     # begin ast.AddressOf(16,9)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(16,9)[inner]
                     # begin ast.LiteralInt(16,17)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(16,17)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(16,15)
label.2:
                     # begin ast.Dereference(17,12)
                     # begin ast.AddressOf(17,12)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(17,12)[inner]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(17,12)
                     # begin ast.LiteralInt(17,20)[100000]
li  $t1, 100000
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(17,20)[100000]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
slt $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.3
                     # begin ast.StatementList(21,7)
                     # begin ast.Call(21,7)[Symbol(badRandom:func(TypeList()):int)]
                     # begin ast.ExpressionList(21,19)
                     # end ast.ExpressionList(21,19)
                     # end arguments
jal func.badRandom
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(21,7)[Symbol(badRandom:func(TypeList()):int)]
lw   $t0, 0($sp)
addi $sp, $sp, 4
                     # begin ast.Assignment(22,17)
                     # begin ast.AddressOf(22,11)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(22,11)[inner]
                     # begin ast.Dereference(22,19)
                     # begin ast.AddressOf(22,19)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(22,19)[inner]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(22,19)
                     # begin ast.LiteralInt(22,27)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(22,27)[1]
lw   $t0, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
add $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(22,17)
                     # end ast.StatementList(21,7)
j label.2
label.3:
                     # begin ast.Assignment(24,15)
                     # begin ast.AddressOf(24,9)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(24,9)[outer]
                     # begin ast.Dereference(24,17)
                     # begin ast.AddressOf(24,17)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(24,17)[outer]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(24,17)
                     # begin ast.LiteralInt(24,25)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(24,25)[1]
lw   $t0, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
add $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(24,15)
                     # end ast.StatementList(15,5)
j label.0
label.1:
                     # begin ast.Call(26,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(26,15)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(26,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(26,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(27,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(27,13)
                     # end ast.ExpressionList(27,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(27,3)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(8,3)
main.epilogue:
addu $sp, $sp, 8
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(7,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
