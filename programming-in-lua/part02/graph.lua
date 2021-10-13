local function name2node(graph, name)
  local node = graph[name]
  if not node then
    node = {name = name, adj = {}}
    graph[name] = node
  end
  return node
end
