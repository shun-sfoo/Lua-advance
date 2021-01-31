local arr = {1, 2, 3, 4, 5,}

local print_array = function(a)
  for i = 1, #a do
    print(a[i])
  end
end

local print_array_1 = function(...)
  local inner = select(1, ...)
  for i = 2, #inner do
    print(inner[i])
  end
end

local print_array_2 = function (...)
  local arg = table.pack(...)
  for i = 1, arg.n - 1  do
    print(arg[i])
  end
end

-- print_array(arr)
-- print_array_1(arr)
print_array_2(1,2,3,4,5)

