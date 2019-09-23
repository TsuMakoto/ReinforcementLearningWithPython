function policy(
                agent::Agent,
                state::State,
                actions::Array{Action, 1};
                r=Nothing,
                act_idx=Nothing
               )

  # 乱数を取得
  r = r == Nothing ? rand() : r
  act_idx == Nothing ? rand(1:length(actions)) : act_idx

  # ϵの値より小さな値であれば、作用のインデックスを返す
  r < agent.ϵ && return act_idx

  if state.cache ∈ keys(agent.Q) && sum(agent.Q[state.cache]) != 0
    return argmax(agent.Q[state.cache])
  end

  rand(1:length(actions))
end
