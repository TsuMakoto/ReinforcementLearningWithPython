# Nodeのチェック
function check(ret_nodes::Array{Node, 1}, true_nodes::Array{Node, 1})::Bool
  # check node length
  if length(ret_nodes) != length(true_nodes)
    return false
  end

  loopdo = length(ret_nodes)
  for idx = 1:loopdo
    x, y = ret_nodes[idx], true_nodes[idx]
    # check state.status
    x.state.status != y.state.status && return false
    # check node.prob
    x.prob != y.prob && return false

    # node.root
    x_root = map(a -> a.direction, x.root[:, 1])
    y_root = map(a -> a.direction, y.root[:, 1])
    # check length equal
    length(x_root) != length(y_root) && return false

    for jdx = 1:length(x_root)
      x_root[jdx] != y_root[jdx] && return false
    end
  end

  # all passed
  true
end

#++++++++++ start root test ++++++++++#
start_transit = Section02.transit(start_node, Action(Section02.UP))
start_check = [
               # start node
               Node(
                    State(Section02.CONTINUE),
                    Section02.MOVE_PROB,
                    [Action(Section02.UP)]
                   ),
               # added node
               Node(
                    State(Section02.CONTINUE),
                    1 - Section02.MOVE_PROB,
                    [Action(Section02.DOWN)]
                   )
              ]
#++++++++++ start root test ++++++++++#
#
#++++++++++ bad end test +++++++++#
bad_transit = Section02.transit(bad_end_node, Action(Section02.UP))
bad_end_check = [
                 # bad end node
                 Node(
                      State(Section02.BAD_END),
                      Section02.END_PROB,
                      []
                     )
                ]
#+++++ bad end test ++++#
#
#++++++++++ happy end test +++++++++#
happy_transit = Section02.transit(happy_end_node, Action(Section02.UP))
happy_end_check = [
                   # happy end node
                   Node(State(Section02.HAPPY_END),
                        Section02.END_PROB,
                        []
                       )
                  ]
#++++++++++ happy end test +++++++++#

@testset "transit test" begin
  @test check(start_transit ,start_check)
  @test check(bad_transit, bad_end_check)
  @test check(happy_transit, happy_end_check)
end
