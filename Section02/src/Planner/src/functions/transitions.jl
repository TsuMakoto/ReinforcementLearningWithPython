function transitions(
                     node::Environments.Node,
                     action::Environments.Action
                    )
  map(
      child -> (child, Environments.reward(child.state)),
      Environments.children(node, action)
     )
end
