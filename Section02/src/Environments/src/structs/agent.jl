mutable struct Action
  direction::Int
  move_x::Int
  move_y::Int
end

mutable struct State
  x::Int
  y::Int
  cell_number::Int
  status::String
end

mutable struct Node
  state::State
  prob::Float64
  root::Array{Action, 1}
end
