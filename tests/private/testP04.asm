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
                     # begin ast.FunctionDefinition(3,1)[Symbol(testDifferentTypes:func(TypeList()):void)]
func.testDifferentTypes:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 8
                     # begin ast.StatementList(4,3)
                     # begin ast.Assignment(5,9)
                     # begin ast.AddressOf(5,7)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(5,7)[a]
                     # begin ast.LiteralInt(5,11)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(5,11)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(5,9)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.1
                     # begin ast.StatementList(8,5)
                     # begin ast.Assignment(9,11)
                     # begin ast.AddressOf(9,9)[a]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(9,9)[a]
                     # begin ast.LiteralFloat(9,13)[8.0]
li.s $f0, 8.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(9,13)[8.0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(9,11)
                     # begin ast.Call(10,5)[Symbol(printFloat:func(TypeList(float)):void)]
                     # begin ast.ExpressionList(10,18)
                     # begin ast.Dereference(10,18)
                     # begin ast.AddressOf(10,18)[a]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,18)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,18)
                     # end ast.ExpressionList(10,18)
                     # end arguments
jal func.printFloat
addi $sp, $sp, 4
                     # end ast.Call(10,5)[Symbol(printFloat:func(TypeList(float)):void)]
                     # begin ast.Call(11,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(11,15)
                     # end ast.ExpressionList(11,15)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(11,5)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(8,5)
j label.0
label.1:
                     # begin ast.StatementList(14,3)
                     # end ast.StatementList(14,3)
label.0:
                     # begin ast.Call(14,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(14,14)
                     # begin ast.Dereference(14,14)
                     # begin ast.AddressOf(14,14)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(14,14)[a]
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
                     # begin ast.Call(15,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(15,13)
                     # end ast.ExpressionList(15,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(15,3)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(4,3)
func.testDifferentTypes.epilogue:
addu $sp, $sp, 8
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(3,1)[Symbol(testDifferentTypes:func(TypeList()):void)]
                     # begin ast.FunctionDefinition(18,1)[Symbol(testSameTypes:func(TypeList()):void)]
func.testSameTypes:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 8
                     # begin ast.StatementList(19,3)
                     # begin ast.Assignment(20,9)
                     # begin ast.AddressOf(20,7)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(20,7)[a]
                     # begin ast.LiteralInt(20,11)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(20,11)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(20,9)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.3
                     # begin ast.StatementList(23,5)
                     # begin ast.Assignment(24,11)
                     # begin ast.AddressOf(24,9)[a]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(24,9)[a]
                     # begin ast.LiteralInt(24,13)[8]
li  $t1, 8
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(24,13)[8]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(24,11)
                     # begin ast.Call(25,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(25,16)
                     # begin ast.Dereference(25,16)
                     # begin ast.AddressOf(25,16)[a]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(25,16)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(25,16)
                     # end ast.ExpressionList(25,16)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(25,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(26,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(26,15)
                     # end ast.ExpressionList(26,15)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(26,5)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(23,5)
j label.2
label.3:
                     # begin ast.StatementList(29,3)
                     # end ast.StatementList(29,3)
label.2:
                     # begin ast.Call(29,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(29,14)
                     # begin ast.Dereference(29,14)
                     # begin ast.AddressOf(29,14)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(29,14)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(29,14)
                     # end ast.ExpressionList(29,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(29,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(30,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(30,13)
                     # end ast.ExpressionList(30,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(30,3)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(19,3)
func.testSameTypes.epilogue:
addu $sp, $sp, 8
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(18,1)[Symbol(testSameTypes:func(TypeList()):void)]
                     # begin ast.FunctionDefinition(33,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(34,3)
                     # begin ast.Call(34,3)[Symbol(testDifferentTypes:func(TypeList()):void)]
                     # begin ast.ExpressionList(34,24)
                     # end ast.ExpressionList(34,24)
                     # end arguments
jal func.testDifferentTypes
addi $sp, $sp, 0
                     # end ast.Call(34,3)[Symbol(testDifferentTypes:func(TypeList()):void)]
                     # begin ast.Call(35,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(35,13)
                     # end ast.ExpressionList(35,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(35,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(36,3)[Symbol(testSameTypes:func(TypeList()):void)]
                     # begin ast.ExpressionList(36,19)
                     # end ast.ExpressionList(36,19)
                     # end arguments
jal func.testSameTypes
addi $sp, $sp, 0
                     # end ast.Call(36,3)[Symbol(testSameTypes:func(TypeList()):void)]
                     # end ast.StatementList(34,3)
main.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(33,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
