-- 八皇后问题
-- 数组{3,7,2,1,8,6,5,4}
-- 表示 (1,3) (2,7) (3,2) (4,1) (5,8) (6,6) (7,5) (8,4)
N = 8
check_cout = 0
flag = false
-- 检查(n,c) 是否不会被攻击
-- a表示已经前n-1已经放好的数组
-- (n,c) 表示 a[n] = c
function isplaceok(a, n, c)
  check_cout = check_cout + 1
  for i = 1, n - 1 do -- 对于每一个放置的皇后
    if
      (a[i] == c) or -- 同一列？
        (a[i] + (n - i) == c) or -- 同一对角线？
        (a[i] - (n - i) == c)
     then -- 同一对角线？
      return false
    end
  end
  return true
end

-- 打印棋盘
function printsolution(a)
  for i = 1, N do
    for j = 1, N do
      io.write(a[i] == j and "x" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

function printarray(a)
  for i = 1, #a do
    io.write(a[i] - 1)
  end
  io.write("\n")
end

function addqueen(a, n)
  if n > N then
    -- flag = true
    -- printsolution(a)
    printarray(a)
  else
    for c = 1, N do
      if isplaceok(a, n, c) then
        a[n] = c
        addqueen(a, n + 1)
      end
    end
  end
end

addqueen({}, 1)
print("check_count: ", check_cout)
