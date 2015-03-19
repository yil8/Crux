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
subu $sp, $sp, 0
                     # begin ast.StatementList(4,3)
                     # begin ast.Call(4,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(4,15)
                     # begin ast.LiteralFloat(4,15)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(4,15)[1.0]
                     # begin ast.LiteralFloat(4,21)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(4,21)[2.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.lt.s $f0, $f2
bc1t label.0
li $t0, 0
j label.1
label.0:
li $t0, 1
label.1:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(4,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(4,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(5,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(5,15)
                     # begin ast.LiteralFloat(5,15)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(5,15)[2.0]
                     # begin ast.LiteralFloat(5,21)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(5,21)[1.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.lt.s $f0, $f2
bc1t label.2
li $t0, 0
j label.3
label.2:
li $t0, 1
label.3:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(5,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(5,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(6,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(6,13)
                     # end ast.ExpressionList(6,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(6,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(7,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(7,15)
                     # begin ast.LiteralFloat(7,15)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(7,15)[1.0]
                     # begin ast.LiteralFloat(7,22)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(7,22)[2.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.le.s $f0, $f2
bc1t label.4
li $t0, 0
j label.5
label.4:
li $t0, 1
label.5:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(7,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(7,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(8,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(8,15)
                     # begin ast.LiteralFloat(8,15)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(8,15)[2.0]
                     # begin ast.LiteralFloat(8,22)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(8,22)[1.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.le.s $f0, $f2
bc1t label.6
li $t0, 0
j label.7
label.6:
li $t0, 1
label.7:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(8,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(8,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(9,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(9,13)
                     # end ast.ExpressionList(9,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(9,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(10,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(10,15)
                     # begin ast.LiteralFloat(10,15)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(10,15)[1.0]
                     # begin ast.LiteralFloat(10,22)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(10,22)[2.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.eq.s $f0, $f2
bc1t label.8
li $t0, 0
j label.9
label.8:
li $t0, 1
label.9:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(10,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(10,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(11,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(11,15)
                     # begin ast.LiteralFloat(11,15)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(11,15)[2.0]
                     # begin ast.LiteralFloat(11,22)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(11,22)[1.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.eq.s $f0, $f2
bc1t label.10
li $t0, 0
j label.11
label.10:
li $t0, 1
label.11:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(11,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(11,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(12,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(12,15)
                     # begin ast.LiteralFloat(12,15)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(12,15)[1.0]
                     # begin ast.LiteralFloat(12,22)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(12,22)[1.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.eq.s $f0, $f2
bc1t label.12
li $t0, 0
j label.13
label.12:
li $t0, 1
label.13:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(12,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(12,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(13,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(13,13)
                     # end ast.ExpressionList(13,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(13,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(14,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(14,15)
                     # begin ast.LiteralFloat(14,15)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(14,15)[1.0]
                     # begin ast.LiteralFloat(14,21)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(14,21)[2.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.le.s $f0, $f2
bc1f label.14
li $t0, 0
j label.15
label.14:
li $t0, 1
label.15:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(14,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(14,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(15,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(15,15)
                     # begin ast.LiteralFloat(15,15)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(15,15)[2.0]
                     # begin ast.LiteralFloat(15,21)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(15,21)[1.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.le.s $f0, $f2
bc1f label.16
li $t0, 0
j label.17
label.16:
li $t0, 1
label.17:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(15,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(15,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(16,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(16,13)
                     # end ast.ExpressionList(16,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(16,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(17,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(17,15)
                     # begin ast.LiteralFloat(17,15)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(17,15)[1.0]
                     # begin ast.LiteralFloat(17,22)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(17,22)[2.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.lt.s $f0, $f2
bc1f label.18
li $t0, 0
j label.19
label.18:
li $t0, 1
label.19:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(17,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(17,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.Call(18,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # begin ast.ExpressionList(18,15)
                     # begin ast.LiteralFloat(18,15)[2.0]
li.s $f0, 2.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(18,15)[2.0]
                     # begin ast.LiteralFloat(18,22)[1.0]
li.s $f0, 1.0
subu $sp, $sp, 4
s.s  $f0, 0($sp)
                     # end ast.LiteralFloat(18,22)[1.0]
l.s $f2, 0($sp)
addi $sp, $sp, 4
l.s $f0, 0($sp)
addi $sp, $sp, 4
c.lt.s $f0, $f2
bc1f label.20
li $t0, 0
j label.21
label.20:
li $t0, 1
label.21:
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(18,15)
                     # end arguments
jal func.printBool
addi $sp, $sp, 4
                     # end ast.Call(18,3)[Symbol(printBool:func(TypeList(bool)):void)]
                     # end ast.StatementList(4,3)
main.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(3,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
