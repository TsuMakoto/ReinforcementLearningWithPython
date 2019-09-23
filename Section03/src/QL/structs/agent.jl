mutable struct Agent
  Q::Dict{Int, Array{Float64, 1}}
  ϵ::Float64
end
