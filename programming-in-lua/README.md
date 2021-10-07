# lua 程序设计

## 排版约定

用双引号表示字符串常量 ： "literal string"

单引号便是单个字符： 'a'

用作模式的字符串也会被单引号包裹起来： '[%w_]\*'

'<-->' 表示两者完全等价

## 参数

`lua -i prog` 让 lua 语言解释器在执行完成指定的程序段后进入交互模式，便于调试。

dofile 在开发阶段很有用，同时打开俩个窗口，一个编辑代码，另一个用交互模式。
修改代码保存后在交互模式下执行 dofile("prog.lua")就可以加载代码。

## 词法规范

lua 语言中的标识符（或名称）由字母(a-z, A-Z)数字和下划线组成的字符串(不能数字开头)。
"下划线+大写字母" `_VERSION` 特殊用途避免用作其他用途
"下划线+小写字母" 用作哑变量(dummy variable)

lua 对大小写敏感

### lua 保留字

```lua
   and   break  do     else elseif
   end   false  goto   for  function
   if    in     local  nil  not
   or    repeat return then true
   until while
```

### 注释

`--`两个连字符在 lua 中表示单行注释

```lua
-- [[ 多行
长注释
]]
```

常见技巧

```lua
-- [[
print(10) -- (被注释了)
-- ]]
```

```lua
--- [[
print(10) --> 10 (启用了)
-- ]]
```

## 类型和值

8 种基本类型：
nil(空)， boolean（布尔）， number（数值）， string（字符串），
userdata（用户数据）, function（函数） thread（线程）， table（表）

```lua
> type(nil) --> nil
> type(true) --> boolean
> type(10.4 * 3) --> number
> type("Hello World") --> string
> type(io.stdin) --> userdata
> type(print) --> function
> type(type) --> thread
> type({}) --> table
> type(type(X)) --> string
```

无论 X 是什么， type() 的返回值是 string
userdata 类型允许把任意 c 语言数据保存在 lua 语言变量中。用户数据除了赋值和相等性测试外，
没有其他预定义操作。用户数据被用来表示由应用或 C 语言编写库所创建的新类型。例如，
标准`I/O`库使用用户数据表示打开的文件

### false 和 nil 之外的值在条件判断中为真

### 逻辑运算符

`and` 如果第一个操作数为"false" 则返回第一个操作数，否则放回第二个操作数;

`or` 如果第一个操作数不为"false" 则返回第一个操作数，否则放回第二个操作数。

## 三元表达式

当 b 不为 false 时`(a and b or c) 等价于 a?b:c`

## arg

arg 预先定义的参数表 0 表示脚本名
1 表示第一个参数

## string 标准库

sting.len(s) == #s

string.rep(s, n) 返回字符串 s 重复 n 次的结果

string.reverse(s) 字符串翻转

string.lower() && string.upper()

string.sub(i,j) 提取第 i 到第 j 个字符的字符串，包含第 i 和第 j 个支持负数索引。

string.byte(s,[i..])返回字符串第 i 个字符的内部数值表示
常见的写法是{strint.byte(s,1, -1)}该表达式会创建一个由字符串 s 中所有的字符代码组成的表。

string.char([i,...]) 接受 0 个或者多个整数作为参数，然后将每个整数转换成对应的字符，最后返回由这些字符连接成的字符串。

string.format() 格式化输出字符串

string.find(s, w) 返回匹配模式的开始结束位置，否则返回 nil

string.gsub(s,p,w) 把所有匹配的模式用另一字符串替换，第二个返回值表示发生替换的次数。

## 表标准库

table.insert(s, i, e) 在指定位置插入一个元素，其他元素后移。不指定位置会在最后插入指定元素。
table.remove(s, i, e) 与 insert 相反。
table.concat(t{})
table.move(a,f,e,t[,{}]) **5.3** 将表 a 中从索引 f 到 e 的元素移动到 t 上。
table.pack({...}) 该函数想{...} 一样保存了所有的函数，然后将其放在一个表返回，保存了一个参数个数 n。
函数 select 总是具有一个固定的参数 selector，以及数量可变的参数，如果 selector 的数值是 n，那么函数 select 则
返回第 n 个参数后的所有参数；否则，selector 应该是字符串'#'，以便返回额外参数的总数。
通常需要把放回值个数调整为 1 的地方使用函数 select,因此可以把 select(n,...) 认为是返回第 n 个额外参数的表达式。

table.unpack() 将真实的列表转换成一组返回值。unpack 函数的重要用途之一体现在范型调用机制中。

## 函数

### 尾递归

当一个函数的最后一个动作是调用另一个函数而没有进行其他工作时，就形成了尾递归。

`function f (x) x = x + 1; return g(x) end`

当函数 f 调用完 g 之后，f 不再需要进行其他的工作。在尾调用之后，程序也就不需要在调用栈保存有关调用函数的任何信息。

## 语言特性

闭包：闭包是指能够访问其自身环境中一个或多个局部变量的函数。

## IO

### 简单 io 模型

io.input()
io.output()
io.read()
io.write()
io.lines()

### 完整 io 模型

io.open()
io.tmpfile()
f:seek(whence, offset)
os.rename()
os.remove()
os.exit()
os.getenv()
os.execute() 等价于 c 的 system
io.popen() 该函数运行一条系统命令，并且可以重定向命令的输入输出
file:seek(whence[,offset]) whence:cur set end
