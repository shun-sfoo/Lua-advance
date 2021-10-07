-- 一个使用goto语句的状态机的示例
-- 用于检验是否包含偶数个0的程序
::s1::
do
  local c = io.read(1)
  if c == "0" then
    goto s2
  elseif c == nil then
    print "ok"
    return
  else
    goto s1
  end
end

::s2::
do
  local c = io.read(1)
  if c == "0" then
    goto s1
  elseif c == nil then
    print "not ok"
    return
  else
    goto s2
  end
end

goto s1
