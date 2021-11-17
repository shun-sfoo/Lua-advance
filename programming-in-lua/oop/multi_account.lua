-- 通过将 __index设置为一个函数实现多重继承， 一般单继承将__index设置为self 是在简易，性能和灵活性方面最均衡的方法
local function search(k, plist)
  for i = 1, #plist do
    local v = plist[i][k]
    if v then
      return v
    end
  end
end

local function createClass(...)
  local c = {} -- new class
  local parents = {...} -- parent class list

  setmetatable(
    c,
    {
      __index = function(t, k)
        return search(k, parents)
      end
    }
  )

  c.__index = c

  function c:new(o)
    o = o or {}
    setmetatable(o, c)
    return o
  end

  return c
end

Account = {balance = 0}

function Account:new(o)
  o = o or {}
  self.__index = self
  setmetatable(o, self)
  return o
end

function Account:deposit(v)
  self.balance = self.balance - v
end

function Account:withdraw(v)
  if v > self.balance then
    error "insufficient funds"
  end
  self.balance = self.balance - v
end

Named = {}
function Named:getname()
  return self.name
end

function Name:setName()
  self.name = n
end

NamedAccount = createClass(Account, Named)

account = NamedAccount:new {name = "Paul"}

print(account:getName())
