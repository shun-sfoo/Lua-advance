function fact(n)
  if n < 0 then
    return "invalid number"
  elseif n == 0 then
    return 1
  else
    return n * fact(n - 1)
  end
end

print("enter a number")
a = io.read("*n") -- 读取一个数字

print(fact(a))

--[[
print(10)
--]]
