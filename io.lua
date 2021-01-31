local prog = function ()
  local t
  if arg[1] == nil then
    t = io.read("a")
  else
    local f = assert(io.open(arg[1]))
    t = f:lines()
    local result
    for line in t do
      local res = sort(line)
      result = res .. '\n'
    end
    print(result)
  end
  io.write(t)
end


sort = function(words)
  local tbl = {}
  local result
  table.insert(tbl, words)
  tbl:sort()
  for _, v in ipairs(tbl) do
    result = result .. " " .. v
  end
  return result
end
prog()
