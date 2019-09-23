using Section03
using Test
using Random: rand

agent_finish() = EpsilonGreedy.Agent(4, 3, [0.1, 0.2, 0.7], 0.2)
agent_continue() = EpsilonGreedy.Agent(4, 2, [0.1, 0.2, 0.7], 0.2)

action_1 = EpsilonGreedy.Action(1)
action_2 = EpsilonGreedy.Action(2)
action_3 = EpsilonGreedy.Action(3)

state01() = EpsilonGreedy.State([5], [2.2])

include("./EG/environments/action.jl")
include("./EG/environments/reward.jl")
include("./EG/environments/state.jl")
include("./EG/environments/transit.jl")

include("./EG/functions/play.jl")

include("./QL/functions/policy.jl")
