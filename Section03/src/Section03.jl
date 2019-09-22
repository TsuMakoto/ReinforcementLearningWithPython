module Section03

using Random: rand

# agent
include("./structs/agent.jl")

# environments
include("./environments/action.jl")
include("./environments/reward.jl")
include("./environments/state.jl")
include("./environments/transit.jl")

# function
include("./functions/play.jl")

end # module
