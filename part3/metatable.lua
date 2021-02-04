local Set = {}
local mt = {}


function Set.new (tbl)
  local set = {}
  setmetatable(set, mt)
  for _, v in pairs(tbl) do
    set[v]= true
  end
  return set
end

-- 合集
function Set.union (tblA, tblB)
  local res = Set.new{}
  for k in pairs(tblA) do res[k] = true end
  for k in pairs(tblB) do res[k] = true end
  return res
end

-- 交集
function Set.intersection (tblA, tblB)
  local res = Set.new{}
  for k in pairs(tblA) do
    res[k] = tblB[k]
  end
  return res
end

function Set.toString (set)
  local l = {}
  for e in pairs(set) do
    l[#l + 1] = e
  end
  return "{"  .. table.concat(l, ", ") .. "}"
end

mt.__add = Set.union
mt.__mul = Set.intersection

mt.__le = function (tblA, tblB) -- 子集 小于等于
  for k in pairs(tblA) do
    if not tblB[k] then return false end
  end
  return true
end

mt.__lt = function (tblA, tblB) -- 真子集  小于
  return tblA <= tblB and not (tblB <= tblA)
end

mt.__eq = function (tblA, tblB)
  return tblA <= tblB and  tblB <= tblA
end

mt.__toString = Set.toString

local s1 = Set.new{10, 20, 30, 50}
local s2 = Set.new{30, 1}
local s3 = s1 + s2

print(Set.toString(s3))
print(Set.toString((s1 + s2) * s1))

s1 = Set.new{2, 4}
s2 = Set.new{4, 10, 2}
print(s1 <= s2)
print(s1 < s2)
print(s1 >= s2)
print(s1 > s2)
print(s1 == s2 * s1)
