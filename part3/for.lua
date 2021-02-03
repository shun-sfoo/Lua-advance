local function values (t)
  local i = 0
  return function () i = i + 1; return t[i] end
end

local tbl = {10, 20, 30}
local titer = values(tbl)

while true do
  local element = titer()
  if element == nil then break end
  print(element)
end

for element in values(tbl) do
  print(element)
end

 local allwords  = function ()
   local line = io.read()
   local pos = 1
   return function ()
     while line do
       local w, e = string.match(line, "(%w+)()", pos)
       if w then
         pos = e
         return w
       else
         line = io.read()
         pos = 1
       end
     end
     return nil
   end
end

for word in allwords() do
  print(word)
end

--[[
范型 for 的语法
范型 for 保存了三个值： 一个迭代函数，一个不可变状态（invariant state），一个控制变量（control variable）
for var_1, ..., var_n in explist do block end
等价于
do
  local _f, _s, _var = explist
  while true do
    local var_1, ..., var_n = _f(_s, var)
    _var = var_1
    if _var == nil then break end
    block
  end
--]]

--[[
无状态迭代器
只根据不可变状态和控制变量为迭代生成下一个元素
--]]
local function self_iter (tbl, i) -- 实现 iparis 的工厂
  i = i + 1
  local v = tbl[i]
  if v then
    return i, v
  end
end

local function self_ipairs (tbl)
  return self_iter, tbl, 0
end

local function self_paris (tbl)
  return next, tbl, nil
end

--[[
无状态迭代器的示例
遍历链表的迭代器
--]]
local function getnext (list, node)
  if not node then
    return list
  else
    return node.next
  end
end

local function traverse (list)
  return getnext, list, nil
end

-- 按顺序遍历表
local lines = {
  ["luaH_set"] = 10,
  ["luaH_get"] = 24,
  ["luaH_present"] = 48,
}

local tbl = {}
for n in pairs(lines) do  tbl[#tbl + 1] = n end
table.sort(tbl)
for _, n in ipairs(tbl) do print(n) end

-- 按照键的顺序来遍历表的迭代器
local function pairsByKeys (tbl, f)
  local b = {}
  for n in pairs(tbl) do
    b[#b + 1] = n
  end
  table.sort(b, f)
  local i = 0
  return function() i = i + 1; return b[i], tbl[b[i]] end
end

for k, v in pairsByKeys(lines) do
  print(k, v)
end

-- 迭代器 formto
local function sformto (n, m)
  local i = n - 1
  return function ()
    i = i + 1
    if i > m then
      return nil
    else
      return i
    end
    end
end

-- 无状态的 formto
local function formto (n, m)
  local function iter (max, current)
    current = current + 1
    if current > max then
      return nil
    else
      return current
    end
  end
  return iter, m, n - 1
end


for i in sformto(1, 5) do
  print("stateful: " .. i)
end


for i in formto(1, 5) do
  print("stateless: " .. i)
end
