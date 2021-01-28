# 排版约定

用双引号表示字符串常量 ： "literal string"

单引号便是单个字符： 'a'

用作模式的字符串也会被单引号包裹起来： '[%w_]\*'

'<-->' 表示两者完全等价

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

8 中基本类型：
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
> type({}) --> thread
> type(type(X)) --> string
```

无论 X 是什么， type() 的返回值是 string
userdata 类型允许把任意 c 语言数据保存在 lua 语言变量中。用户数据除了赋值和相等性测试外，
没有其他预定义操作。用户数据被用来表示由应用或 C 语言编写库所创建的新类型。例如，
标准`I/O`库使用用户数据表示打开的文件

## 三元表达式

`(a and b or c) ==> C中的 a?b:c`
