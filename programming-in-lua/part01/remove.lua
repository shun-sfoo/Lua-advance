function remove(s, i, j)
  t1 = s:sub(1, i - 1)
  t2 = s:sub(i + j, #s)
  return t1 .. t2
end
