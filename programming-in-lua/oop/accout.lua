Accout = {balance = 0}

function Accout:new(o)
  o = o or {}
  self.__index = self
  setmetatable(o, self)
  return o
end

function Accout:deposit(v)
  self.balance = self.balance + v
end

function Accout:withdraw(v)
  if v > self.balance then
    error "insufficient funds"
  end
  self.balance = self.balance - v
end

SpecialAccout = Accout:new()

s = SpecialAccout:new {limit = 1000.00}

function SpecialAccout:withdraw(v)
  if v - self.balance >= self:getLimit() then
    error "insufficient funds"
  end
  self.balance = self.balance - v
end

function SpecialAccout:getLimit()
  return self.limit or 0
end

function s:getLimit()
  return self.balance * 0.10
end
