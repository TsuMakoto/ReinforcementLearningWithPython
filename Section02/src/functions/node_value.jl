# V(s) = R(s) + γ * max{a}{∑{s'}{T(s'|s,a)V(s')}}
#
# s = uuudの場合
# case a = u:
#   s' ∈ {uuudu, uuudd}
#   T = T({uuudu, uuudd} | s,a) = {0.9, 0.1}
#   V = V({uuudu, uuudd}) = {1, -1}
#   Σ(T * V) = sum({0.9, -0.1}) = 0.8
#   V(s) = R(s) + γ * max{a}{∑{s'}{T(s'|s,a)V(s')}}
#        = 0 + 0.99 * 0.8
#        = 0.78408
#
# case a = d:
#   s' ∈ {uuudu, uuudd}
#   T = T({uuudd, uuudu} | s,a) = {0.1, 0.9}
#   V = V({uuudd, uuudu}) = {-1, 1}
#   Σ(T * V) = sum({-0.1, 0.9}) = 0.8
#   V(s) = R(s) + γ * max{a}{∑{s'}{T(s'|s,a)V(s')}}
#        = 0 + 0.99 * 0.8
#        = 0.78408
#
function node_value(node::Node; γ=0.99)::Float64
  node.state.status ∈ [HAPPY_END, BAD_END] && return reward(node)

  values = map(
               action -> sum(
                             map(
                                 child -> child.prob * node_value(child),
                                 transit(node, action)
                                )
                            ) * γ + reward(node),
               [Action(UP), Action(DOWN)]
              )
  maximum(values)
end
