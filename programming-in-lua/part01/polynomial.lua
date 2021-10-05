function poly1(t, x)
  local result = 0
  local n = #t
  for i = n, 1, -1 do
    result = result + t[i] * x ^ (i - 1)
  end
  return result
end

function poly2(t, x)
  local result = 0
  local n = #t
  for i = n, 2, -1 do
    result = (result + t[n]) * x
  end

  result = result + a[1]

  return result
end
