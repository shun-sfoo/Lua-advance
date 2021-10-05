function fact(n)
  local result = 1
  if n < 0 then return "wrong argument" end

  for i = 1 , n , 1 do 
    result = result *  i
  end
  return result
end

function fact_rec(n)
  if n < 0 then
    return "wrong argument" 
  elseif n == 1 then
    return 1
  else return n * fact_rec( n - 1)
  end
end

print("enter a number:")
a = io.read("*n") -- 读取一个数字
print(fact(a))
print(fact_rec(a))
