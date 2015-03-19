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
subu $sp, $sp, 12
                     # begin ast.StatementList(4,3)
                     # begin ast.Assignment(5,13)
                     # begin ast.AddressOf(5,7)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(5,7)[outer]
                     # begin ast.LiteralInt(5,15)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(5,15)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(5,13)
label.0:
                     # begin ast.Dereference(6,10)
                     # begin ast.AddressOf(6,10)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(6,10)[outer]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(6,10)
                     # begin ast.LiteralInt(6,18)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(6,18)[1]
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
                     # begin ast.StatementList(11,5)
                     # begin ast.Assignment(12,15)
                     # begin ast.AddressOf(12,9)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(12,9)[inner]
                     # begin ast.LiteralInt(12,17)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(12,17)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(12,15)
label.2:
                     # begin ast.Dereference(13,12)
                     # begin ast.AddressOf(13,12)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(13,12)[inner]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(13,12)
                     # begin ast.LiteralInt(13,20)[100000]
li  $t1, 100000
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(13,20)[100000]
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
                     # begin ast.StatementList(16,7)
                     # begin ast.Assignment(17,17)
                     # begin ast.AddressOf(17,11)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(17,11)[inner]
                     # begin ast.Dereference(17,19)
                     # begin ast.AddressOf(17,19)[inner]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(17,19)[inner]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(17,19)
                     # begin ast.LiteralInt(17,27)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(17,27)[1]
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
                     # end ast.Assignment(17,17)
                     # end ast.StatementList(16,7)
j label.2
label.3:
                     # begin ast.Assignment(19,15)
                     # begin ast.AddressOf(19,9)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(19,9)[outer]
                     # begin ast.Dereference(19,17)
                     # begin ast.AddressOf(19,17)[outer]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(19,17)[outer]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(19,17)
                     # begin ast.LiteralInt(19,25)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(19,25)[1]
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
                     # end ast.Assignment(19,15)
                     # end ast.StatementList(11,5)
j label.0
label.1:
                     # begin ast.Call(21,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(21,15)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(21,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(21,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(22,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(22,13)
                     # end ast.ExpressionList(22,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(22,3)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(4,3)
main.epilogue:
addu $sp, $sp, 12
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(3,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
