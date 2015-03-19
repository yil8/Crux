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
                     # begin ast.FunctionDefinition(3,1)[Symbol(case1:func(TypeList(bool)):int)]
func.case1:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(4,3)
                     # begin ast.Dereference(5,7)
                     # begin ast.AddressOf(5,7)[cond]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(5,7)[cond]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(5,7)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.1
                     # begin ast.StatementList(6,5)
                     # begin ast.Assignment(6,11)
                     # begin ast.AddressOf(6,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(6,9)[a]
                     # begin ast.LiteralInt(6,13)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(6,13)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(6,11)
                     # end ast.StatementList(6,5)
j label.0
label.1:
                     # begin ast.StatementList(8,5)
                     # begin ast.Assignment(8,11)
                     # begin ast.AddressOf(8,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(8,9)[a]
                     # begin ast.LiteralInt(8,13)[8]
li  $t1, 8
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(8,13)[8]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(8,11)
                     # end ast.StatementList(8,5)
label.0:
                     # begin ast.Dereference(10,10)
                     # begin ast.AddressOf(10,10)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(10,10)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(10,10)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case1.epilogue
                     # end ast.StatementList(4,3)
func.case1.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(3,1)[Symbol(case1:func(TypeList(bool)):int)]
                     # begin ast.FunctionDefinition(13,1)[Symbol(case2:func(TypeList(bool)):int)]
func.case2:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(14,3)
                     # begin ast.Dereference(16,7)
                     # begin ast.AddressOf(16,7)[cond]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(16,7)[cond]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(16,7)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.3
                     # begin ast.StatementList(17,5)
                     # begin ast.Assignment(17,11)
                     # begin ast.AddressOf(17,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(17,9)[a]
                     # begin ast.LiteralInt(17,13)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(17,13)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(17,11)
                     # begin ast.Dereference(18,12)
                     # begin ast.AddressOf(18,12)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(18,12)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(18,12)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case2.epilogue
                     # begin ast.Assignment(19,11)
                     # begin ast.AddressOf(19,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(19,9)[a]
                     # begin ast.LiteralInt(19,13)[10]
li  $t1, 10
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(19,13)[10]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(19,11)
                     # end ast.StatementList(17,5)
j label.2
label.3:
                     # begin ast.StatementList(21,5)
                     # begin ast.Assignment(21,11)
                     # begin ast.AddressOf(21,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(21,9)[a]
                     # begin ast.LiteralInt(21,13)[8]
li  $t1, 8
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(21,13)[8]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(21,11)
                     # end ast.StatementList(21,5)
label.2:
                     # begin ast.Dereference(23,10)
                     # begin ast.AddressOf(23,10)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(23,10)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(23,10)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case2.epilogue
                     # end ast.StatementList(14,3)
func.case2.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(13,1)[Symbol(case2:func(TypeList(bool)):int)]
                     # begin ast.FunctionDefinition(26,1)[Symbol(case3:func(TypeList(bool)):int)]
func.case3:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(27,3)
                     # begin ast.Dereference(29,7)
                     # begin ast.AddressOf(29,7)[cond]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(29,7)[cond]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(29,7)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.5
                     # begin ast.StatementList(30,5)
                     # begin ast.Assignment(30,11)
                     # begin ast.AddressOf(30,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(30,9)[a]
                     # begin ast.LiteralInt(30,13)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(30,13)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(30,11)
                     # end ast.StatementList(30,5)
j label.4
label.5:
                     # begin ast.StatementList(32,5)
                     # begin ast.Assignment(32,11)
                     # begin ast.AddressOf(32,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(32,9)[a]
                     # begin ast.LiteralInt(32,13)[8]
li  $t1, 8
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(32,13)[8]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(32,11)
                     # begin ast.Dereference(33,12)
                     # begin ast.AddressOf(33,12)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(33,12)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(33,12)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case3.epilogue
                     # begin ast.Assignment(34,11)
                     # begin ast.AddressOf(34,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(34,9)[a]
                     # begin ast.LiteralInt(34,13)[10]
li  $t1, 10
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(34,13)[10]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(34,11)
                     # end ast.StatementList(32,5)
label.4:
                     # begin ast.Dereference(36,10)
                     # begin ast.AddressOf(36,10)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(36,10)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(36,10)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case3.epilogue
                     # end ast.StatementList(27,3)
func.case3.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(26,1)[Symbol(case3:func(TypeList(bool)):int)]
                     # begin ast.FunctionDefinition(39,1)[Symbol(case4:func(TypeList(bool)):int)]
func.case4:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 8
                     # begin ast.StatementList(40,3)
                     # begin ast.Assignment(41,9)
                     # begin ast.AddressOf(41,7)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(41,7)[a]
                     # begin ast.LiteralInt(41,11)[10]
li  $t1, 10
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(41,11)[10]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(41,9)
                     # begin ast.Assignment(44,9)
                     # begin ast.AddressOf(44,7)[i]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(44,7)[i]
                     # begin ast.LiteralInt(44,11)[0]
li  $t1, 0
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(44,11)[0]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(44,9)
label.6:
                     # begin ast.Dereference(45,10)
                     # begin ast.AddressOf(45,10)[cond]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(45,10)[cond]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(45,10)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.7
                     # begin ast.StatementList(46,5)
                     # begin ast.Assignment(46,11)
                     # begin ast.AddressOf(46,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(46,9)[a]
                     # begin ast.LiteralInt(46,13)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(46,13)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(46,11)
                     # begin ast.Dereference(47,12)
                     # begin ast.AddressOf(47,12)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(47,12)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(47,12)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case4.epilogue
                     # begin ast.Assignment(48,11)
                     # begin ast.AddressOf(48,9)[i]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(48,9)[i]
                     # begin ast.Dereference(48,13)
                     # begin ast.AddressOf(48,13)[i]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(48,13)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(48,13)
                     # begin ast.LiteralInt(48,17)[1]
li  $t1, 1
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(48,17)[1]
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
                     # end ast.Assignment(48,11)
                     # begin ast.Assignment(49,14)
                     # begin ast.AddressOf(49,9)[cond]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(49,9)[cond]
                     # begin ast.Dereference(49,16)
                     # begin ast.AddressOf(49,16)[i]
addi $t0, $fp, -16
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(49,16)[i]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(49,16)
                     # begin ast.LiteralInt(49,20)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(49,20)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t0, 0($sp)
addi $sp, $sp, 4
slt $t0, $t0, $t1
subu $sp, $sp, 4
sw   $t0, 0($sp)
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(49,14)
                     # end ast.StatementList(46,5)
j label.6
label.7:
                     # begin ast.Dereference(51,10)
                     # begin ast.AddressOf(51,10)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(51,10)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(51,10)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case4.epilogue
                     # end ast.StatementList(40,3)
func.case4.epilogue:
addu $sp, $sp, 8
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(39,1)[Symbol(case4:func(TypeList(bool)):int)]
                     # begin ast.FunctionDefinition(54,1)[Symbol(case5:func(TypeList(bool)):int)]
func.case5:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 4
                     # begin ast.StatementList(55,3)
                     # begin ast.Dereference(57,7)
                     # begin ast.AddressOf(57,7)[cond]
addi $t0, $fp, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(57,7)[cond]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(57,7)
lw   $t1, 0($sp)
addi $sp, $sp, 4
beqz $t1, label.9
                     # begin ast.StatementList(58,5)
                     # begin ast.Assignment(58,11)
                     # begin ast.AddressOf(58,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(58,9)[a]
                     # begin ast.LiteralInt(58,13)[7]
li  $t1, 7
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(58,13)[7]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(58,11)
                     # begin ast.Dereference(59,12)
                     # begin ast.AddressOf(59,12)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(59,12)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(59,12)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case5.epilogue
                     # begin ast.Assignment(60,11)
                     # begin ast.AddressOf(60,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(60,9)[a]
                     # begin ast.LiteralInt(60,13)[11]
li  $t1, 11
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(60,13)[11]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(60,11)
                     # end ast.StatementList(58,5)
j label.8
label.9:
                     # begin ast.StatementList(62,5)
                     # begin ast.Assignment(62,11)
                     # begin ast.AddressOf(62,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(62,9)[a]
                     # begin ast.LiteralInt(62,13)[8]
li  $t1, 8
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(62,13)[8]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(62,11)
                     # begin ast.Dereference(63,12)
                     # begin ast.AddressOf(63,12)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(63,12)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(63,12)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case5.epilogue
                     # begin ast.Assignment(64,11)
                     # begin ast.AddressOf(64,9)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(64,9)[a]
                     # begin ast.LiteralInt(64,13)[10]
li  $t1, 10
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.LiteralInt(64,13)[10]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw   $t2, 0($sp)
addi $sp, $sp, 4
sw $t1, 0($t2)
                     # end ast.Assignment(64,11)
                     # end ast.StatementList(62,5)
label.8:
                     # begin ast.Dereference(66,10)
                     # begin ast.AddressOf(66,10)[a]
addi $t0, $fp, -12
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.AddressOf(66,10)[a]
lw   $t1, 0($sp)
addi $sp, $sp, 4
lw $t1, 0($t1)
subu $sp, $sp, 4
sw   $t1, 0($sp)
                     # end ast.Dereference(66,10)
lw   $v0, 0($sp)
addi $sp, $sp, 4
j func.case5.epilogue
                     # end ast.StatementList(55,3)
func.case5.epilogue:
addu $sp, $sp, 4
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(54,1)[Symbol(case5:func(TypeList(bool)):int)]
                     # begin ast.FunctionDefinition(69,1)[Symbol(main:func(TypeList()):void)]
main:
subu $sp, $sp, 8
sw   $fp, 0($sp)
sw   $ra, 4($sp)
addi $fp, $sp, 8
subu $sp, $sp, 0
                     # begin ast.StatementList(70,3)
                     # begin ast.Call(70,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(70,14)
                     # begin ast.Call(70,14)[Symbol(case1:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(70,22)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(70,22)
                     # end arguments
jal func.case1
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(70,14)[Symbol(case1:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(70,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(70,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(71,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(71,13)
                     # end ast.ExpressionList(71,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(71,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(72,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(72,14)
                     # begin ast.Call(72,14)[Symbol(case1:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(72,22)
li $t0, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(72,22)
                     # end arguments
jal func.case1
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(72,14)[Symbol(case1:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(72,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(72,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(73,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(73,13)
                     # end ast.ExpressionList(73,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(73,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(74,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(74,13)
                     # end ast.ExpressionList(74,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(74,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(76,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(76,14)
                     # begin ast.Call(76,14)[Symbol(case2:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(76,22)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(76,22)
                     # end arguments
jal func.case2
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(76,14)[Symbol(case2:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(76,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(76,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(77,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(77,13)
                     # end ast.ExpressionList(77,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(77,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(78,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(78,14)
                     # begin ast.Call(78,14)[Symbol(case2:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(78,22)
li $t0, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(78,22)
                     # end arguments
jal func.case2
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(78,14)[Symbol(case2:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(78,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(78,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(79,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(79,13)
                     # end ast.ExpressionList(79,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(79,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(80,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(80,13)
                     # end ast.ExpressionList(80,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(80,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(82,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(82,14)
                     # begin ast.Call(82,14)[Symbol(case3:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(82,22)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(82,22)
                     # end arguments
jal func.case3
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(82,14)[Symbol(case3:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(82,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(82,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(83,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(83,13)
                     # end ast.ExpressionList(83,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(83,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(84,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(84,14)
                     # begin ast.Call(84,14)[Symbol(case3:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(84,22)
li $t0, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(84,22)
                     # end arguments
jal func.case3
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(84,14)[Symbol(case3:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(84,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(84,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(85,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(85,13)
                     # end ast.ExpressionList(85,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(85,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(86,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(86,13)
                     # end ast.ExpressionList(86,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(86,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(88,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(88,14)
                     # begin ast.Call(88,14)[Symbol(case4:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(88,22)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(88,22)
                     # end arguments
jal func.case4
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(88,14)[Symbol(case4:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(88,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(88,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(89,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(89,13)
                     # end ast.ExpressionList(89,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(89,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(90,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(90,14)
                     # begin ast.Call(90,14)[Symbol(case4:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(90,22)
li $t0, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(90,22)
                     # end arguments
jal func.case4
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(90,14)[Symbol(case4:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(90,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(90,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(91,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(91,13)
                     # end ast.ExpressionList(91,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(91,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(92,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(92,13)
                     # end ast.ExpressionList(92,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(92,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(94,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(94,14)
                     # begin ast.Call(94,14)[Symbol(case5:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(94,22)
li $t0, 1
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(94,22)
                     # end arguments
jal func.case5
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(94,14)[Symbol(case5:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(94,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(94,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(95,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(95,13)
                     # end ast.ExpressionList(95,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(95,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(96,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.ExpressionList(96,14)
                     # begin ast.Call(96,14)[Symbol(case5:func(TypeList(bool)):int)]
                     # begin ast.ExpressionList(96,22)
li $t0, 0
subu $sp, $sp, 4
sw   $t0, 0($sp)
                     # end ast.ExpressionList(96,22)
                     # end arguments
jal func.case5
addi $sp, $sp, 4
subu $sp, $sp, 4
sw   $v0, 0($sp)
                     # end ast.Call(96,14)[Symbol(case5:func(TypeList(bool)):int)]
                     # end ast.ExpressionList(96,14)
                     # end arguments
jal func.printInt
addi $sp, $sp, 4
                     # end ast.Call(96,3)[Symbol(printInt:func(TypeList(int)):void)]
                     # begin ast.Call(97,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(97,13)
                     # end ast.ExpressionList(97,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(97,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.Call(98,3)[Symbol(println:func(TypeList()):void)]
                     # begin ast.ExpressionList(98,13)
                     # end ast.ExpressionList(98,13)
                     # end arguments
jal func.println
addi $sp, $sp, 0
                     # end ast.Call(98,3)[Symbol(println:func(TypeList()):void)]
                     # end ast.StatementList(70,3)
main.epilogue:
addu $sp, $sp, 0
lw   $ra, 4($sp)
lw   $fp, 0($sp)
addu $sp, $sp, 8
jr   $ra
                     # end ast.FunctionDefinition(69,1)[Symbol(main:func(TypeList()):void)]
                     # end ast.DeclarationList(3,1)
                              # END Code Segment
