.data                         # BEGIN Data Segment
cruxdata.a: .space 28
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
                     # begin ast.FunctionDefinition(5,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(6,3)
                     # begin ast.Assignment(8,9)
                     # begin ast.AddressOf(8,7)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(8,7)[i]
                     # begin ast.LiteralInt(8,11)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(8,11)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(8,9)
label.0:
                     # begin ast.Dereference(9,10)
                     # begin ast.AddressOf(9,10)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(9,10)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(9,10)
                     # begin ast.LiteralInt(9,14)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(9,14)[7]
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
                     # begin ast.StatementList(10,5)
                     # begin ast.Assignment(10,14)
                     # begin ast.Index(10,11)
                     # begin ast.AddressOf(10,9)[a]
la  $t0, cruxdata.a
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,9)[a]
                     # begin ast.Dereference(10,11)
                     # begin ast.AddressOf(10,11)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,11)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,11)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(10,11)
                     # begin ast.Dereference(10,17)
                     # begin ast.AddressOf(10,17)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,17)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,17)
                     # begin ast.LiteralInt(10,21)[4]
li  $t1, 4
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(10,21)[4]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
sgt $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(10,14)
                     # begin ast.Assignment(11,11)
                     # begin ast.AddressOf(11,9)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(11,9)[i]
                     # begin ast.Dereference(11,13)
                     # begin ast.AddressOf(11,13)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(11,13)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(11,13)
                     # begin ast.LiteralInt(11,17)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(11,17)[1]
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
                     # end ast.Assignment(11,11)
                     # end ast.StatementList(10,5)
j label.0
label.1:
                     # begin ast.Assignment(14,9)
                     # begin ast.AddressOf(14,7)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(14,7)[i]
                     # begin ast.LiteralInt(14,11)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(14,11)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(14,9)
label.2:
                     # begin ast.Dereference(15,10)
                     # begin ast.AddressOf(15,10)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(15,10)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(15,10)
                     # begin ast.LiteralInt(15,14)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(15,14)[7]
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
                     # begin ast.StatementList(16,5)
                     # begin ast.Call(16,5)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(16,17)
                     # begin ast.Dereference(16,17)
                     # begin ast.Index(16,19)
                     # begin ast.AddressOf(16,17)[a]
la  $t0, cruxdata.a
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(16,17)[a]
                     # begin ast.Dereference(16,19)
                     # begin ast.AddressOf(16,19)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(16,19)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(16,19)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(16,19)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(16,17)
                     # end ast.ExpressionList(16,17)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(16,5)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(17,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(17,15)
                     # end ast.ExpressionList(17,15)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(17,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Assignment(18,11)
                     # begin ast.AddressOf(18,9)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(18,9)[i]
                     # begin ast.Dereference(18,13)
                     # begin ast.AddressOf(18,13)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(18,13)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(18,13)
                     # begin ast.LiteralInt(18,17)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,17)[1]
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
                     # end ast.Assignment(18,11)
                     # end ast.StatementList(16,5)
j label.2
label.3:
                     # end ast.StatementList(6,3)
main.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(5,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
