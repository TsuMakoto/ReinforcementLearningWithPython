module Environments

export Action, State, Node, Logger

# constants
include("./constants.jl")

# structs
include("./structs/agent.jl")
include("./structs/logger.jl")

# util
equal_cell(src::State, dst::State) = src.x == dst.x && src.y == dst.y

state_cell_number(x::Int, y::Int) = (x - 1) + (y - 1) * length(X_RANGE)

state_x_y(cell_number::Int)::Tuple{Int64,Int64} =
  cell_number % length(X_RANGE) + 1, cell_number ÷ length(X_RANGE) + 1

is_block_cell(state::State) = GRID[state.y, state.x] == BLOCK
is_ordinary_cell(state::State) = GRID[state.y, state.x] == ORDINARY
is_damage_cell(state::State) = GRID[state.y, state.x] == DAMAGE
is_reward_cell(state::State) = GRID[state.y, state.x] == REWARD

states = begin
  list = []
  for cell_number ∈ 0:length(X_RANGE) * length(Y_RANGE) - 1
    x_y = state_x_y(cell_number)
    state = State(
                  x_y[1],
                  x_y[2],
                  cell_number,
                  CONTINUE
                 )
    if !is_block_cell(state)
      push!(list, state)
    end
  end
  list
end

actions = begin
  map(d -> Action(
                  d,
                  DIRECTIONS[d][1],
                  DIRECTIONS[d][2]
                 ),
      DIRS
     )
end


# functions
include("./functions/children.jl")
include("./functions/reward.jl")

end # module
