function poem_writer(file1, file2)
  local r = file1 or "poem"
  -- local w = file2 or r
  local f = assert(io.open(r, "w"))
  local t = {}
  for i = 1, math.huge do
    local line = f:read("L")
    print(line)
    if line == nil then
      break
    end
    table.insert(t, line)
  end
  table.sort(t)
  for _, line in ipairs(t) do
    f:write(line)
  end

  -- f:write(t)
end

poem_writer()
