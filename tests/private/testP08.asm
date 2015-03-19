.data                         # BEGIN Data Segment
cruxdata.colcount: .space 4
cruxdata.rowcount: .space 4
cruxdata.rule: .space 4
cruxdata.data: .space 328
cruxdata.rulebin: .space 32
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
                     # begin ast.FunctionDefinition(9,1)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
func.setNextBit:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(10,3)
                     # begin ast.Assignment(10,32)
                     # begin ast.Index(10,26)
                     # begin ast.Index(10,21)
                     # begin ast.Index(10,15)
                     # begin ast.AddressOf(10,7)[rulebin]
la  $t0, cruxdata.rulebin
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,7)[rulebin]
                     # begin ast.Dereference(10,15)
                     # begin ast.AddressOf(10,15)[last]
addi $t0, $fp, 12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,15)[last]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,15)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 16
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(10,15)
                     # begin ast.Dereference(10,21)
                     # begin ast.AddressOf(10,21)[akt]
addi $t0, $fp, 8
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,21)[akt]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,21)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 8
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(10,21)
                     # begin ast.Dereference(10,26)
                     # begin ast.AddressOf(10,26)[next]
addi $t0, $fp, 4
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,26)[next]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,26)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(10,26)
                     # begin ast.Dereference(10,34)
                     # begin ast.AddressOf(10,34)[bits]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,34)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,34)
                     # begin ast.Dereference(10,42)
                     # begin ast.AddressOf(10,42)[bits]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,42)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,42)
                     # begin ast.LiteralInt(10,49)[2]
li  $t1, 2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(10,49)[2]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
div $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # begin ast.LiteralInt(10,54)[2]
li  $t1, 2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(10,54)[2]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
mul $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
sub $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(10,32)
                     # begin ast.Dereference(11,10)
                     # begin ast.AddressOf(11,10)[bits]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(11,10)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(11,10)
                     # begin ast.LiteralInt(11,17)[2]
li  $t1, 2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(11,17)[2]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
div $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.setNextBit.epilogue
                     # end ast.StatementList(10,3)
func.setNextBit.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(9,1)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.FunctionDefinition(14,1)[Symbol(initrulebin:func(TypeList()):void)]
func.initrulebin:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(15,3)
                     # begin ast.Assignment(16,12)
                     # begin ast.AddressOf(16,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(16,7)[bits]
                     # begin ast.Dereference(16,14)
                     # begin ast.AddressOf(16,14)[rule]
la  $t0, cruxdata.rule
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(16,14)[rule]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(16,14)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(16,12)
                     # begin ast.Assignment(17,12)
                     # begin ast.AddressOf(17,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(17,7)[bits]
                     # begin ast.Call(17,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(17,27)
                     # begin ast.LiteralInt(17,27)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(17,27)[0]
                     # begin ast.LiteralInt(17,30)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(17,30)[0]
                     # begin ast.LiteralInt(17,33)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(17,33)[0]
                     # begin ast.Dereference(17,36)
                     # begin ast.AddressOf(17,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(17,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(17,36)
                     # end ast.ExpressionList(17,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(17,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(17,12)
                     # begin ast.Assignment(18,12)
                     # begin ast.AddressOf(18,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(18,7)[bits]
                     # begin ast.Call(18,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(18,27)
                     # begin ast.LiteralInt(18,27)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,27)[0]
                     # begin ast.LiteralInt(18,30)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,30)[0]
                     # begin ast.LiteralInt(18,33)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,33)[1]
                     # begin ast.Dereference(18,36)
                     # begin ast.AddressOf(18,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(18,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(18,36)
                     # end ast.ExpressionList(18,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(18,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(18,12)
                     # begin ast.Assignment(19,12)
                     # begin ast.AddressOf(19,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(19,7)[bits]
                     # begin ast.Call(19,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(19,27)
                     # begin ast.LiteralInt(19,27)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(19,27)[0]
                     # begin ast.LiteralInt(19,30)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(19,30)[1]
                     # begin ast.LiteralInt(19,33)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(19,33)[0]
                     # begin ast.Dereference(19,36)
                     # begin ast.AddressOf(19,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(19,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(19,36)
                     # end ast.ExpressionList(19,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(19,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(19,12)
                     # begin ast.Assignment(20,12)
                     # begin ast.AddressOf(20,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(20,7)[bits]
                     # begin ast.Call(20,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(20,27)
                     # begin ast.LiteralInt(20,27)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(20,27)[0]
                     # begin ast.LiteralInt(20,30)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(20,30)[1]
                     # begin ast.LiteralInt(20,33)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(20,33)[1]
                     # begin ast.Dereference(20,36)
                     # begin ast.AddressOf(20,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(20,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(20,36)
                     # end ast.ExpressionList(20,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(20,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(20,12)
                     # begin ast.Assignment(21,12)
                     # begin ast.AddressOf(21,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(21,7)[bits]
                     # begin ast.Call(21,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(21,27)
                     # begin ast.LiteralInt(21,27)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(21,27)[1]
                     # begin ast.LiteralInt(21,30)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(21,30)[0]
                     # begin ast.LiteralInt(21,33)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(21,33)[0]
                     # begin ast.Dereference(21,36)
                     # begin ast.AddressOf(21,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(21,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(21,36)
                     # end ast.ExpressionList(21,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(21,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(21,12)
                     # begin ast.Assignment(22,12)
                     # begin ast.AddressOf(22,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(22,7)[bits]
                     # begin ast.Call(22,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(22,27)
                     # begin ast.LiteralInt(22,27)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(22,27)[1]
                     # begin ast.LiteralInt(22,30)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(22,30)[0]
                     # begin ast.LiteralInt(22,33)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(22,33)[1]
                     # begin ast.Dereference(22,36)
                     # begin ast.AddressOf(22,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(22,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(22,36)
                     # end ast.ExpressionList(22,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(22,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(22,12)
                     # begin ast.Assignment(23,12)
                     # begin ast.AddressOf(23,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(23,7)[bits]
                     # begin ast.Call(23,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(23,27)
                     # begin ast.LiteralInt(23,27)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(23,27)[1]
                     # begin ast.LiteralInt(23,30)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(23,30)[1]
                     # begin ast.LiteralInt(23,33)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(23,33)[0]
                     # begin ast.Dereference(23,36)
                     # begin ast.AddressOf(23,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(23,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(23,36)
                     # end ast.ExpressionList(23,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(23,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(23,12)
                     # begin ast.Assignment(24,12)
                     # begin ast.AddressOf(24,7)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(24,7)[bits]
                     # begin ast.Call(24,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
                     # begin ast.ExpressionList(24,27)
                     # begin ast.LiteralInt(24,27)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(24,27)[1]
                     # begin ast.LiteralInt(24,30)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(24,30)[1]
                     # begin ast.LiteralInt(24,33)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(24,33)[1]
                     # begin ast.Dereference(24,36)
                     # begin ast.AddressOf(24,36)[bits]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(24,36)[bits]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(24,36)
                     # end ast.ExpressionList(24,27)
                     # end arguments
jal func.setNextBit
addi $sp, $sp, 16
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(24,14)[Symbol(setNextBit:func(TypeList(int, int, int, int)):int)]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(24,12)
                     # end ast.StatementList(15,3)
func.initrulebin.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(14,1)[Symbol(initrulebin:func(TypeList()):void)]
                     # begin ast.FunctionDefinition(27,1)[Symbol(clearData:func(TypeList()):void)]
func.clearData:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(28,3)
                     # begin ast.Assignment(29,9)
                     # begin ast.AddressOf(29,7)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(29,7)[i]
                     # begin ast.LiteralInt(29,11)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(29,11)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(29,9)
label.0:
                     # begin ast.Dereference(30,10)
                     # begin ast.AddressOf(30,10)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(30,10)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(30,10)
                     # begin ast.Dereference(30,14)
                     # begin ast.AddressOf(30,14)[colcount]
la  $t0, cruxdata.colcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(30,14)[colcount]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(30,14)
                     # begin ast.LiteralInt(30,25)[2]
li  $t1, 2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(30,25)[2]
lw   $t0, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
add $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
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
                     # begin ast.StatementList(31,5)
                     # begin ast.Assignment(31,17)
                     # begin ast.Index(31,14)
                     # begin ast.AddressOf(31,9)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(31,9)[data]
                     # begin ast.Dereference(31,14)
                     # begin ast.AddressOf(31,14)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(31,14)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(31,14)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(31,14)
                     # begin ast.LiteralInt(31,19)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(31,19)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(31,17)
                     # begin ast.Assignment(32,11)
                     # begin ast.AddressOf(32,9)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(32,9)[i]
                     # begin ast.Dereference(32,13)
                     # begin ast.AddressOf(32,13)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(32,13)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(32,13)
                     # begin ast.LiteralInt(32,17)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(32,17)[1]
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
                     # end ast.Assignment(32,11)
                     # end ast.StatementList(31,5)
j label.0
label.1:
                     # end ast.StatementList(28,3)
func.clearData.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(27,1)[Symbol(clearData:func(TypeList()):void)]
                     # begin ast.FunctionDefinition(36,1)[Symbol(output:func(TypeList()):void)]
func.output:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(37,3)
                     # begin ast.Assignment(39,9)
                     # begin ast.AddressOf(39,7)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(39,7)[i]
                     # begin ast.LiteralInt(39,11)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(39,11)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(39,9)
label.2:
                     # begin ast.Dereference(40,10)
                     # begin ast.AddressOf(40,10)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(40,10)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(40,10)
                     # begin ast.Dereference(40,15)
                     # begin ast.AddressOf(40,15)[colcount]
la  $t0, cruxdata.colcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(40,15)[colcount]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(40,15)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
sle $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.3
                     # begin ast.StatementList(41,5)
                     # begin ast.Dereference(41,9)
                     # begin ast.Index(41,14)
                     # begin ast.AddressOf(41,9)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(41,9)[data]
                     # begin ast.Dereference(41,14)
                     # begin ast.AddressOf(41,14)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(41,14)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(41,14)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(41,14)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(41,9)
                     # begin ast.LiteralInt(41,20)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(41,20)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
seq $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.5
                     # begin ast.StatementList(42,7)
                     # begin ast.Call(42,7)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(42,18)
                     # begin ast.LiteralInt(42,18)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(42,18)[1]
                     # end ast.ExpressionList(42,18)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(42,7)[Symbol(printInt:func(TypeList(int)):void)]
                     # end ast.StatementList(42,7)
j label.4
label.5:
                     # begin ast.StatementList(44,7)
                     # begin ast.Dereference(44,11)
                     # begin ast.Index(44,16)
                     # begin ast.AddressOf(44,11)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(44,11)[data]
                     # begin ast.Dereference(44,16)
                     # begin ast.AddressOf(44,16)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(44,16)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(44,16)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(44,16)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(44,11)
                     # begin ast.LiteralInt(44,22)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(44,22)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
seq $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.7
                     # begin ast.StatementList(45,9)
                     # begin ast.Call(45,9)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(45,20)
                     # begin ast.LiteralInt(45,20)[8]
li  $t1, 8
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(45,20)[8]
                     # end ast.ExpressionList(45,20)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(45,9)[Symbol(printInt:func(TypeList(int)):void)]
                     # end ast.StatementList(45,9)
j label.6
label.7:
                     # begin ast.StatementList(47,9)
                     # begin ast.Call(47,9)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(47,20)
                     # begin ast.LiteralInt(47,20)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(47,20)[0]
                     # end ast.ExpressionList(47,20)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(47,9)[Symbol(printInt:func(TypeList(int)):void)]
                     # end ast.StatementList(47,9)
label.6:
                     # end ast.StatementList(44,7)
label.4:
                     # begin ast.Assignment(50,11)
                     # begin ast.AddressOf(50,9)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(50,9)[i]
                     # begin ast.Dereference(50,13)
                     # begin ast.AddressOf(50,13)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(50,13)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(50,13)
                     # begin ast.LiteralInt(50,17)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(50,17)[1]
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
                     # end ast.Assignment(50,11)
                     # end ast.StatementList(41,5)
j label.2
label.3:
                     # begin ast.Call(52,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(52,13)
                     # end ast.ExpressionList(52,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(52,3)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(37,3)
func.output.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(36,1)[Symbol(output:func(TypeList()):void)]
                     # begin ast.FunctionDefinition(55,1)[Symbol(calcnext:func(TypeList()):void)]
func.calcnext:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 16
                     # begin ast.StatementList(56,3)
                     # begin ast.Assignment(61,15)
                     # begin ast.Index(61,12)
                     # begin ast.AddressOf(61,7)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(61,7)[data]
                     # begin ast.LiteralInt(61,12)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(61,12)[0]
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(61,12)
                     # begin ast.Dereference(61,17)
                     # begin ast.Index(61,22)
                     # begin ast.AddressOf(61,17)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(61,17)[data]
                     # begin ast.LiteralInt(61,22)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(61,22)[1]
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(61,22)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(61,17)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(61,15)
                     # begin ast.Assignment(62,26)
                     # begin ast.Index(62,12)
                     # begin ast.AddressOf(62,7)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(62,7)[data]
                     # begin ast.Dereference(62,12)
                     # begin ast.AddressOf(62,12)[colcount]
la  $t0, cruxdata.colcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(62,12)[colcount]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(62,12)
                     # begin ast.LiteralInt(62,23)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(62,23)[1]
lw   $t0, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
add $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(62,12)
                     # begin ast.Dereference(62,28)
                     # begin ast.Index(62,33)
                     # begin ast.AddressOf(62,28)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(62,28)[data]
                     # begin ast.Dereference(62,33)
                     # begin ast.AddressOf(62,33)[colcount]
la  $t0, cruxdata.colcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(62,33)[colcount]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(62,33)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(62,33)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(62,28)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(62,26)
                     # begin ast.Assignment(64,12)
                     # begin ast.AddressOf(64,7)[last]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(64,7)[last]
                     # begin ast.Dereference(64,14)
                     # begin ast.Index(64,19)
                     # begin ast.AddressOf(64,14)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(64,14)[data]
                     # begin ast.LiteralInt(64,19)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(64,19)[0]
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(64,19)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(64,14)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(64,12)
                     # begin ast.Assignment(65,11)
                     # begin ast.AddressOf(65,7)[akt]
addi $t0, $fp, -20
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(65,7)[akt]
                     # begin ast.Dereference(65,13)
                     # begin ast.Index(65,18)
                     # begin ast.AddressOf(65,13)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(65,13)[data]
                     # begin ast.LiteralInt(65,18)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(65,18)[1]
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(65,18)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(65,13)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(65,11)
                     # begin ast.Assignment(67,9)
                     # begin ast.AddressOf(67,7)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(67,7)[i]
                     # begin ast.LiteralInt(67,11)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(67,11)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(67,9)
label.8:
                     # begin ast.Dereference(68,10)
                     # begin ast.AddressOf(68,10)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(68,10)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(68,10)
                     # begin ast.Dereference(68,15)
                     # begin ast.AddressOf(68,15)[colcount]
la  $t0, cruxdata.colcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(68,15)[colcount]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(68,15)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
sle $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.9
                     # begin ast.StatementList(69,5)
                     # begin ast.Assignment(69,14)
                     # begin ast.AddressOf(69,9)[next]
addi $t0, $fp, -24
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(69,9)[next]
                     # begin ast.Dereference(69,16)
                     # begin ast.Index(69,21)
                     # begin ast.AddressOf(69,16)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(69,16)[data]
                     # begin ast.Dereference(69,21)
                     # begin ast.AddressOf(69,21)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(69,21)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(69,21)
                     # begin ast.LiteralInt(69,23)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(69,23)[1]
lw   $t0, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
add $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(69,21)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(69,16)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(69,14)
                     # begin ast.Assignment(70,17)
                     # begin ast.Index(70,14)
                     # begin ast.AddressOf(70,9)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(70,9)[data]
                     # begin ast.Dereference(70,14)
                     # begin ast.AddressOf(70,14)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(70,14)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(70,14)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(70,14)
                     # begin ast.Dereference(70,19)
                     # begin ast.Index(70,38)
                     # begin ast.Index(70,33)
                     # begin ast.Index(70,27)
                     # begin ast.AddressOf(70,19)[rulebin]
la  $t0, cruxdata.rulebin
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(70,19)[rulebin]
                     # begin ast.Dereference(70,27)
                     # begin ast.AddressOf(70,27)[last]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(70,27)[last]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(70,27)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 16
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(70,27)
                     # begin ast.Dereference(70,33)
                     # begin ast.AddressOf(70,33)[akt]
addi $t0, $fp, -20
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(70,33)[akt]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(70,33)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 8
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(70,33)
                     # begin ast.Dereference(70,38)
                     # begin ast.AddressOf(70,38)[next]
addi $t0, $fp, -24
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(70,38)[next]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(70,38)
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(70,38)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(70,19)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(70,17)
                     # begin ast.Assignment(72,14)
                     # begin ast.AddressOf(72,9)[last]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(72,9)[last]
                     # begin ast.Dereference(72,16)
                     # begin ast.AddressOf(72,16)[akt]
addi $t0, $fp, -20
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(72,16)[akt]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(72,16)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(72,14)
                     # begin ast.Assignment(73,13)
                     # begin ast.AddressOf(73,9)[akt]
addi $t0, $fp, -20
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(73,9)[akt]
                     # begin ast.Dereference(73,15)
                     # begin ast.AddressOf(73,15)[next]
addi $t0, $fp, -24
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(73,15)[next]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(73,15)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(73,13)
                     # begin ast.Assignment(74,11)
                     # begin ast.AddressOf(74,9)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(74,9)[i]
                     # begin ast.Dereference(74,13)
                     # begin ast.AddressOf(74,13)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(74,13)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(74,13)
                     # begin ast.LiteralInt(74,17)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(74,17)[1]
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
                     # end ast.Assignment(74,11)
                     # end ast.StatementList(69,5)
j label.8
label.9:
                     # end ast.StatementList(56,3)
func.calcnext.epilogue:
addu $sp, $sp, 16
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(55,1)[Symbol(calcnext:func(TypeList()):void)]
                     # begin ast.FunctionDefinition(78,1)[Symbol(run:func(TypeList()):void)]
func.run:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(79,3)
                     # begin ast.Assignment(80,9)
                     # begin ast.AddressOf(80,7)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(80,7)[i]
                     # begin ast.LiteralInt(80,11)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(80,11)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(80,9)
label.10:
                     # begin ast.Dereference(81,10)
                     # begin ast.AddressOf(81,10)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(81,10)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(81,10)
                     # begin ast.Dereference(81,14)
                     # begin ast.AddressOf(81,14)[rowcount]
la  $t0, cruxdata.rowcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(81,14)[rowcount]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(81,14)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
slt $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.11
                     # begin ast.StatementList(82,5)
                     # begin ast.Call(82,5)[Symbol(output:func(TypeList()):void)]
                     # begin ast.ExpressionList(82,14)
                     # end ast.ExpressionList(82,14)
                     # end arguments
jal func.output
addi $sp, $sp, 0
                     # end ast.Call(82,5)[Symbol(output:func(TypeList()):void)]
                     # begin ast.Call(83,5)[Symbol(calcnext:func(TypeList()):void)]
                     # begin ast.ExpressionList(83,16)
                     # end ast.ExpressionList(83,16)
                     # end arguments
jal func.calcnext
addi $sp, $sp, 0
                     # end ast.Call(83,5)[Symbol(calcnext:func(TypeList()):void)]
                     # begin ast.Assignment(84,11)
                     # begin ast.AddressOf(84,9)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(84,9)[i]
                     # begin ast.Dereference(84,13)
                     # begin ast.AddressOf(84,13)[i]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(84,13)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(84,13)
                     # begin ast.LiteralInt(84,17)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(84,17)[1]
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
                     # end ast.Assignment(84,11)
                     # end ast.StatementList(82,5)
j label.10
label.11:
                     # end ast.StatementList(79,3)
func.run.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(78,1)[Symbol(run:func(TypeList()):void)]
                     # begin ast.FunctionDefinition(88,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(89,3)
                     # begin ast.Assignment(89,16)
                     # begin ast.AddressOf(89,7)[colcount]
la  $t0, cruxdata.colcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(89,7)[colcount]
                     # begin ast.LiteralInt(89,18)[80]
li  $t1, 80
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(89,18)[80]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(89,16)
                     # begin ast.Assignment(90,16)
                     # begin ast.AddressOf(90,7)[rowcount]
la  $t0, cruxdata.rowcount
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(90,7)[rowcount]
                     # begin ast.LiteralInt(90,18)[60]
li  $t1, 60
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(90,18)[60]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(90,16)
                     # begin ast.Assignment(92,12)
                     # begin ast.AddressOf(92,7)[rule]
la  $t0, cruxdata.rule
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(92,7)[rule]
                     # begin ast.LiteralInt(92,14)[22]
li  $t1, 22
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(92,14)[22]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(92,12)
                     # begin ast.Call(93,3)[Symbol(initrulebin:func(TypeList()):void)]
                     # begin ast.ExpressionList(93,17)
                     # end ast.ExpressionList(93,17)
                     # end arguments
jal func.initrulebin
addi $sp, $sp, 0
                     # end ast.Call(93,3)[Symbol(initrulebin:func(TypeList()):void)]
                     # begin ast.Call(95,3)[Symbol(clearData:func(TypeList()):void)]
                     # begin ast.ExpressionList(95,15)
                     # end ast.ExpressionList(95,15)
                     # end arguments
jal func.clearData
addi $sp, $sp, 0
                     # end ast.Call(95,3)[Symbol(clearData:func(TypeList()):void)]
                     # begin ast.Assignment(96,16)
                     # begin ast.Index(96,12)
                     # begin ast.AddressOf(96,7)[data]
la  $t0, cruxdata.data
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(96,7)[data]
                     # begin ast.LiteralInt(96,12)[40]
li  $t1, 40
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(96,12)[40]
lw   $t2, 0($sp)
addi $sp, $sp, 4
lw   $t1, 0($sp)
addi $sp, $sp, 4
li   $t3, 4
mul  $t2, $t2, $t3
add  $t1, $t1, $t2
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Index(96,12)
                     # begin ast.LiteralInt(96,18)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(96,18)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(96,16)
                     # begin ast.Call(98,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(98,14)
                     # begin ast.Dereference(98,14)
                     # begin ast.AddressOf(98,14)[rule]
la  $t0, cruxdata.rule
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(98,14)[rule]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(98,14)
                     # end ast.ExpressionList(98,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(98,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(99,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(99,13)
                     # end ast.ExpressionList(99,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(99,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(100,3)[Symbol(run:func(TypeList()):void)]
                     # begin ast.ExpressionList(100,9)
                     # end ast.ExpressionList(100,9)
                     # end arguments
jal func.run
addi $sp, $sp, 0
                     # end ast.Call(100,3)[Symbol(run:func(TypeList()):void)]
                     # end ast.StatementList(89,3)
main.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(88,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
