# 遷移関数
function transit(node::Node, action::Action)::Array{Node, 1}
  root = map(x -> x.direction, node.root[:,1])

  children(parent::Node, a::Action) = begin
    opposite = Action(if a.direction == DOWN; UP else; DOWN end)
    [
     Node(State(CONTINUE), MOVE_PROB, push!(copy(parent.root), a)),
     Node(State(CONTINUE), 1 - MOVE_PROB, push!(copy(parent.root), opposite))
    ]
  end

  if length(root) == LIMIT_GAME_COUNT
    root_up_count = length(root[root .== UP])
    end_status = (root_up_count >= HAPPY_END_BORDER) ? HAPPY_END : BAD_END
    end_prob = END_PROB
    return [Node(State(end_status), END_PROB, [])]
  end

  children(node, action)
end
