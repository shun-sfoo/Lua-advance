function insert(s, i, p)
  t1 = s:sub(1, i - 1)
  t2 = s:sub(i, #s)
  t = t1 .. p .. t2
  return t
end
