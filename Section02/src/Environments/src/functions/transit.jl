actions = [
          Action(UP, MOVE_UP[1], MOVE_UP[2]),
          Action(DOWN, MOVE_DOWN[1], MOVE_DOWN[2]),
          Action(RIGHT, MOVE_RIGHT[1], MOVE_RIGHT[2]),
          Action(LEFT, MOVE_LEFT[1], MOVE_LEFT[2])
         ]


equal_cell(src::State, dst::State) = src.x == dst.x && src.y == dst.y

state_cell_number(x::Int, y::Int) = (x - 1) + (y - 1) * length(Y_RANGE)

is_block_cell(state::State) = GRID[state.x][state.y] == BLOCK

is_ordinary_cell(state::State) = GRID[state.x][state.y] == ORDINARY

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
    is_block_cell(child_state)

    return child
  end

  State(-1, -1, -1, CANNOT_MOVE)
end

# 遷移関数
function transit(node::Node, action::Action; move_prob=0.8)::Array{Node, 1}
  transit_cell = []
  if !is_ordinary_cell(state)
    return []
  end

  oppsite = Action(-action.direction, -action.move_x, -action.move_y)

  for a ∈ actions
    prob == action.direction ? move_prob : (1 - move_prob) / 2

    child_state = move(node.state, action)
    if child_state.cell_number ∈ keys(transit_cell)
      transit_cell[child_state.cell_number] += prob
    else
      transit_cell[child_state.cell_number] = prob
    end
  end
end
