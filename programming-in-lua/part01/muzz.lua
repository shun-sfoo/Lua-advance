-- |1|2|
-- |3|4|
-- 四个房间的迷宫游戏 从1走到4

goto room1 -- 起始房间

::room1::
do
  local move = io.read()
  if move == "south" then
    goto room3
  elseif move == "east" then
    goto room2
  else
    print("invalid move")
    goto room1 -- 待在同一个房间
  end
end

::room2::
do
  local move = io.read()
  if move == "east" then
    goto room4
  elseif move == "west" then
    goto room1
  else
    print("invalid move")
    goto room2
  end
end

::room3::
do
  local move = io.read()
  if move == "north" then
    goto room1
  elseif move == "east" then
    goto room4
  else
    print("invalid move")
    goto room3
  end
end

::room4::
do
  print("Congratulations, you won!")
end
