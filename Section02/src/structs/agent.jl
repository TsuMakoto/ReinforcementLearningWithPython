mutable struct Action
  direction::String
end

mutable struct State
  status::String
end

mutable struct Node
  state::State
  prob::Float64
  root::Array{Action, 1}
end
