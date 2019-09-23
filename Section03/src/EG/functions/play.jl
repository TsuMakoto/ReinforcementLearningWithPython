play(agent::Agent;
     policy_r=Nothing, policy_idx=Nothing, transit_r=Nothing) = begin
  state = State(zeros(length(agent.probs)), zeros(length(agent.probs)))
  done = false
  rewards = []

  function policy(state::State, ϵ::Float64; r=Nothing, idx=Nothing)::Action
    if r == Nothing
      r = rand()
    end

    if idx == Nothing
      idx = rand(1:length(state.expected_values))
    end

    Action(r < ϵ ? idx : argmax(state.expected_values))
  end

  while !done
    selected = policy(state, agent.ϵ; r=policy_r, idx=policy_idx)
    reward, done = transit(agent, selected; r=transit_r)
    push!(rewards, reward)

    state.toss_counts[selected.toss] += 1
    state.expected_values[selected.toss] = update_Ex(state,
                                                     selected.toss,
                                                     reward)
  end

  return rewards
end
