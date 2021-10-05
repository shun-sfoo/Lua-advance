--[[
八皇后问题
用一个8个数字组成的简单数组表示可能的解决方案
{3,7,2,1,8,6,5,4} 表示：
(1,3) (2,7) (3,2) (4,1) (5,8) (6,6) (7,5) (8,4)
]]

local N = 8 -- 棋盘大小
local count = 0

-- 检查(n,c) 是否不会被攻击
 local isplaceok = function (a, n, c)
  for i = 1, n - 1 do
    if (a[i] == c) or             -- 同一列
      (a[i] == c - ( n - i)) or   -- 对角线
      (a[i] == c + ( n - i)) then -- 对角线
      return false
    end
  end
  return true
end


-- 打印棋盘
local printsolution = function (a)
  for i = 1, N do    -- 对于每一行
    for j = 1, N do  -- 和每一列
      -- 输入"X" 或者 "-" ,外加一个空格
      io.write(a[i] == j and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

-- 把从 'n'到'N' 所有的皇后放在棋盘'a'上
addqueen = function (a, n)
  if n > N then
    count = count + 1
    printsolution(a)
  else
    for c = 1, N do
      if isplaceok(a, n, c) then
        a[n] = c
        addqueen(a, n + 1)
      end
    end
  end
end

addqueen ({}, 1)
print(count)
