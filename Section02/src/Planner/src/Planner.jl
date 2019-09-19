module Planner

# include Environments
include("../../Environments/src/Environments.jl")
using .Environments

# functions
include("./functions/transitions.jl")

regist_grid_log(
                grid_node::Array{Environments.Node,1},
                grid_accessor::Array{}

                logger::Logger
               ) = begin

  for y ∈ grid_node'
    grid_y = ""
    for x ∈ y
      prob = x.second.prob
      grid_y += (
                 "###########" + "\n" +
                 "#         #" + "\n" +
                 "# $(prob) #" + "\n" +
                 "#         #" + "\n" +
                 "###########"
                )
    end
    logger.log += grid_y + "^\n"
  end
end

# planner実行
function plan(γ=0.9, threshold=0.0001)
  all_grid_node = map(
                      row_node -> map(s -> Node(s, 0, []), row_node),
                      Environments.states
                     )

  logger = Logger("")
  while true
    δ = 0
    regist_grid_log(all_grid_node, logger)

    for node ∈ all_grid_node
      if Environments.is_block_cell
        continue
      end

      expected_reward = []
      for action ∈ actions
        r = 0
        for (child, reward) ∈ transitions(node, action)
          r += (
                child.prob *
                (reward[1] +
                 γ * all_grid_node[child.state.cell_number]
                )
               )
        end
        push!(r, expected_reward)
      end
      maximum_reward = maximum_reward(expected_reward)
      δ = max(
              δ,
              abs(
                  maximum_reward -
                  all_grid_node[node.state.cell_number]
                 )
             )
      all_grid_node[node.state.cell_number] = maximum_reward
    end
    δ < threshold && break
  end
  regist_grid_log(all_grid_node, logger)
end


end # module
