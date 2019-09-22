using Section03
using Test
using Random: rand

agent_finish() = Agent(4, 3, [0.1, 0.2, 0.7], 0.2)
agent_continue() = Agent(4, 2, [0.1, 0.2, 0.7], 0.2)

action_1 = Action(1)
action_2 = Action(2)
action_3 = Action(3)

state01() = State([5], [2.2])

include("./environments/action.jl")
include("./environments/reward.jl")
include("./environments/state.jl")
include("./environments/transit.jl")

include("./functions/play.jl")
