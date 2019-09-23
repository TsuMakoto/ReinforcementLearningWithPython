module Section03

export EpsilonGreedy,QLearning

using Random: rand

module EpsilonGreedy

# agent
include("./EG/structs/agent.jl")

# environments
include("./EG/environments/action.jl")
include("./EG/environments/reward.jl")
include("./EG/environments/state.jl")
include("./EG/environments/transit.jl")

# function
include("./EG/functions/play.jl")

end

module QLearning

# agent
include("./QL/structs/agent.jl")

# environments
include("./QL/environments/action.jl")
include("./QL/environments/reward.jl")
include("./QL/environments/state.jl")
include("./QL/environments/transit.jl")

# function
include("./QL/functions/policy.jl")

end

end # module
