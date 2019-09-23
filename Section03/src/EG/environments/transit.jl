transit(agent::Agent, action::Action; r=Nothing) = begin
  # agentの行動回数を設定
  final = agent.max_episode_steps

  if agent.game_count >= final
    throw("The step count exceeded maximum.")
  end

  if action.toss > length(agent.probs)
    throw("The No.$(action.toss) coin dosen't exist.")
  end

  agent.game_count += 1

  reward(agent.probs[action.toss]; r=r), agent.game_count == final
end
