.data                         # BEGIN Data Segment
cruxdata.a: .space 4
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
                     # begin ast.FunctionDefinition(5,1)[Symbol(badFunc:func(TypeList()):int)]
func.badFunc:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(6,3)
                     # begin ast.LiteralInt(6,10)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(6,10)[0]
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.badFunc.epilogue
                     # begin ast.Assignment(7,9)
                     # begin ast.AddressOf(7,7)[a]
la  $t0, cruxdata.a
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(7,7)[a]
                     # begin ast.LiteralInt(7,11)[10]
li  $t1, 10
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(7,11)[10]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(7,9)
                     # end ast.StatementList(6,3)
func.badFunc.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(5,1)[Symbol(badFunc:func(TypeList()):int)]
                     # begin ast.FunctionDefinition(10,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(11,3)
                     # begin ast.Assignment(11,9)
                     # begin ast.AddressOf(11,7)[a]
la  $t0, cruxdata.a
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(11,7)[a]
                     # begin ast.LiteralInt(11,11)[42]
li  $t1, 42
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(11,11)[42]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(11,9)
                     # begin ast.Call(12,3)[Symbol(badFunc:func(TypeList()):int)]
                     # begin ast.ExpressionList(12,13)
                     # end ast.ExpressionList(12,13)
                     # end arguments
jal func.badFunc
addi $sp, $sp, 0
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(12,3)[Symbol(badFunc:func(TypeList()):int)]
lw   $t0, 0($sp)
addi $sp, $sp, 4
                     # begin ast.Call(13,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(13,14)
                     # begin ast.Dereference(13,14)
                     # begin ast.AddressOf(13,14)[a]
la  $t0, cruxdata.a
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
                     # end ast.StatementList(11,3)
main.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(10,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
