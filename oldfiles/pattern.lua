local str = "some string"
local split

for w in str:gmatch("%a+") do
  print(w)
end

str = "Deadline is 30/05/1999, firm"
local date = "%d%d%/%d%d%/%d%d%d%d"
print(str:match(date))

local toxml

function toxml (s)
  s = string.gsub(s, "\\(%a+)(%b{})", function (tag, body)
    body = string.sub(body, 2, -2) -- 移除括号
    body = toxml(body)       -- 处理嵌套
    return string.format("<%s>%s</%s>", tag , body , tag)
  end)
  return s
end

print(toxml("\\title{The \\bold{big} example}"))

function split (s, sep)
  local tbl = {}
  for v in string.gmatch(s, "([^" .. sep .. "]+)") do -- 找到非sep的位置
    table.insert(tbl, v)
  end
  return tbl
end

local t = split("a whole new world", " ")
print(t)

local transliterate

function transliterate (s, tbl)
  s = string.gsub(s, "%a", function (c)
    return tbl[c] ~= false and tbl[c] or ""
  end)
  return s
end

local s1 = "aaaabbb"
local tbl1 = {
  a = false,
  b = "c",
}

s1 = transliterate(s1, tbl1)
print(s1)

local trim

function trim (s)
  s = string.gsub(s, "^%s*(.-)%s*$", "%1")
  return s
end

s1 = "      abbb  cc dd aa     "
print(trim(s1))
