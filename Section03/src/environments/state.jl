export State
mutable struct State
  toss_counts::Array{Int, 1}
  expected_values::Array{Float64, 1}
end

function update_Ex(state::State, selected::Int, reward::Float64)
  sum = state.expected_values[selected] * state.toss_counts[selected] + reward
  sum / (state.toss_counts[selected] + 1)
end
