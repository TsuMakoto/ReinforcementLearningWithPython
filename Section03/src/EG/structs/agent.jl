mutable struct Agent
  max_episode_steps::Int
  game_count::Int
  probs::Array{Float64, 1}
  ϵ::Float64
end
