# child stateを求める
move(state::State, action::Action)::State = begin
  if !is_ordinary_cell(state)
    return State(-1, -1, -1, CANNOT_MOVE)
  end

  x = state.x + DIRECTIONS[action.direction][1]
  y = state.y + DIRECTIONS[action.direction][2]
  child_state = State(x, y, state_cell_number(x, y), state.status)

  if child_state.x ∈ X_RANGE &&
    child_state.y ∈ Y_RANGE &&
    !is_block_cell(child_state)

    return child_state
  end

  State(-1, -1, -1, CANNOT_MOVE)
end

# 遷移関数
function children(node::Node, action::Action; move_prob=0.8)::Array{Node, 1}
  transit_cell = Dict([])
  if !is_ordinary_cell(node.state)
    return []
  end

  oppsite = Action(-action.direction, -action.move_x, -action.move_y)

  for act ∈ actions
    prob = if action.direction == act.direction
             move_prob
           elseif act.direction ≠ oppsite.direction
             (1 - move_prob) / 2
           else
             0
           end

    child_state = move(node.state, act)
    if child_state.status == CANNOT_MOVE
      continue
    end

    child = Node(child_state, prob, push!(copy(node.root), act))
    if child_state.cell_number ∈ keys(transit_cell)
      transit_cell[child_state.cell_number].prob += prob
    else
      transit_cell[child_state.cell_number] = child
    end
  end
  map(child -> child, values(transit_cell))
end
