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
                     # begin ast.FunctionDefinition(3,1)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
func.hanoi:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(4,3)
                     # begin ast.Dereference(4,7)
                     # begin ast.AddressOf(4,7)[n]
addi $t0, $fp, 12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(4,7)[n]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(4,7)
                     # begin ast.LiteralInt(4,12)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(4,12)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
seq $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.1
                     # begin ast.StatementList(5,5)
                     # begin ast.Call(5,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(5,16)
                     # begin ast.Dereference(5,16)
                     # begin ast.AddressOf(5,16)[from]
addi $t0, $fp, 8
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(5,16)[from]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(5,16)
                     # end ast.ExpressionList(5,16)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(5,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(6,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(6,16)
                     # begin ast.Dereference(6,16)
                     # begin ast.AddressOf(6,16)[to]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(6,16)[to]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(6,16)
                     # end ast.ExpressionList(6,16)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(6,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(7,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(7,15)
                     # end ast.ExpressionList(7,15)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(7,5)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(5,5)
j label.0
label.1:
                     # begin ast.StatementList(9,5)
                     # begin ast.Call(9,5)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
                     # begin ast.ExpressionList(9,13)
                     # begin ast.Dereference(9,13)
                     # begin ast.AddressOf(9,13)[n]
addi $t0, $fp, 12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(9,13)[n]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(9,13)
                     # begin ast.LiteralInt(9,15)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(9,15)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
sub $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # begin ast.Dereference(9,17)
                     # begin ast.AddressOf(9,17)[from]
addi $t0, $fp, 8
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(9,17)[from]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(9,17)
                     # begin ast.Dereference(9,22)
                     # begin ast.AddressOf(9,22)[to]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(9,22)[to]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(9,22)
                     # begin ast.Dereference(9,25)
                     # begin ast.AddressOf(9,25)[temp]
addi $t0, $fp, 4
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(9,25)[temp]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(9,25)
                     # end ast.ExpressionList(9,13)
                     # end arguments
jal func.hanoi
addi $sp, $sp, 16
                     # end ast.Call(9,5)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
                     # begin ast.Call(10,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(10,16)
                     # begin ast.Dereference(10,16)
                     # begin ast.AddressOf(10,16)[from]
addi $t0, $fp, 8
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,16)[from]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,16)
                     # end ast.ExpressionList(10,16)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(10,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(11,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(11,16)
                     # begin ast.Dereference(11,16)
                     # begin ast.AddressOf(11,16)[to]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(11,16)[to]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(11,16)
                     # end ast.ExpressionList(11,16)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(11,5)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(12,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(12,15)
                     # end ast.ExpressionList(12,15)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(12,5)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(13,5)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
                     # begin ast.ExpressionList(13,13)
                     # begin ast.Dereference(13,13)
                     # begin ast.AddressOf(13,13)[n]
addi $t0, $fp, 12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(13,13)[n]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(13,13)
                     # begin ast.LiteralInt(13,15)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(13,15)[1]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
sub $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # begin ast.Dereference(13,17)
                     # begin ast.AddressOf(13,17)[temp]
addi $t0, $fp, 4
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(13,17)[temp]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(13,17)
                     # begin ast.Dereference(13,22)
                     # begin ast.AddressOf(13,22)[from]
addi $t0, $fp, 8
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(13,22)[from]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(13,22)
                     # begin ast.Dereference(13,27)
                     # begin ast.AddressOf(13,27)[to]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(13,27)[to]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(13,27)
                     # end ast.ExpressionList(13,13)
                     # end arguments
jal func.hanoi
addi $sp, $sp, 16
                     # end ast.Call(13,5)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
                     # end ast.StatementList(9,5)
label.0:
                     # end ast.StatementList(4,3)
func.hanoi.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(3,1)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
                     # begin ast.FunctionDefinition(17,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(18,3)
                     # begin ast.Call(18,3)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
                     # begin ast.ExpressionList(18,11)
                     # begin ast.LiteralInt(18,11)[5]
li  $t1, 5
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,11)[5]
                     # begin ast.LiteralInt(18,14)[111]
li  $t1, 111
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,14)[111]
                     # begin ast.LiteralInt(18,18)[222]
li  $t1, 222
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,18)[222]
                     # begin ast.LiteralInt(18,22)[333]
li  $t1, 333
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(18,22)[333]
                     # end ast.ExpressionList(18,11)
                     # end arguments
jal func.hanoi
addi $sp, $sp, 16
                     # end ast.Call(18,3)[Symbol(hanoi:func(TypeList(int, int, int, int)):void)]
                     # end ast.StatementList(18,3)
main.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(17,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
