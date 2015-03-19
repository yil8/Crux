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
                     # begin ast.FunctionDefinition(7,1)[Symbol(test:func(TypeList()):int)]
func.test:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(8,3)
                     # begin ast.Call(8,3)[Symbol(badRandom:func(TypeList()):int)]
                     # begin ast.ExpressionList(8,15)
                     # end ast.ExpressionList(8,15)
                     # end arguments
jal func.badRandom
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(8,3)[Symbol(badRandom:func(TypeList()):int)]
lw   $t0, 0($sp)
addi $sp, $sp, 4
                     # begin ast.Call(9,3)[Symbol(badRandom:func(TypeList()):int)]
                     # begin ast.ExpressionList(9,15)
                     # end ast.ExpressionList(9,15)
                     # end arguments
jal func.badRandom
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(9,3)[Symbol(badRandom:func(TypeList()):int)]
lw   $t0, 0($sp)
addi $sp, $sp, 4
                     # begin ast.Call(10,3)[Symbol(badRandom:func(TypeList()):int)]
                     # begin ast.ExpressionList(10,15)
                     # end ast.ExpressionList(10,15)
                     # end arguments
jal func.badRandom
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(10,3)[Symbol(badRandom:func(TypeList()):int)]
lw   $t0, 0($sp)
addi $sp, $sp, 4
                     # begin ast.Call(11,3)[Symbol(badRandom:func(TypeList()):int)]
                     # begin ast.ExpressionList(11,15)
                     # end ast.ExpressionList(11,15)
                     # end arguments
jal func.badRandom
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(11,3)[Symbol(badRandom:func(TypeList()):int)]
lw   $t0, 0($sp)
addi $sp, $sp, 4
                     # begin ast.LiteralInt(12,10)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(12,10)[1]
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.test.epilogue
                     # end ast.StatementList(8,3)
func.test.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(7,1)[Symbol(test:func(TypeList()):int)]
                     # begin ast.FunctionDefinition(15,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(16,3)
                     # begin ast.Assignment(18,9)
                     # begin ast.AddressOf(18,7)[x]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(18,7)[x]
                     # begin ast.LiteralInt(18,11)[41]
li  $t1, 41
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,11)[41]
                     # begin ast.Call(18,16)[Symbol(test:func(TypeList()):int)]
                     # begin ast.ExpressionList(18,23)
                     # end ast.ExpressionList(18,23)
                     # end arguments
jal func.test
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(18,16)[Symbol(test:func(TypeList()):int)]
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
                     # end ast.Assignment(18,9)
                     # begin ast.Call(19,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(19,14)
                     # begin ast.Dereference(19,14)
                     # begin ast.AddressOf(19,14)[x]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(19,14)[x]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(19,14)
                     # end ast.ExpressionList(19,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(19,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # end ast.StatementList(16,3)
main.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(15,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
