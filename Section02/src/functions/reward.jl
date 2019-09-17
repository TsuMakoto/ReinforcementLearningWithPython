reward(node::Node)::Int = begin
  if node.state.status == HAPPY_END
    1
  elseif node.state.status == BAD_END
    -1
  else
    0
  end
end
