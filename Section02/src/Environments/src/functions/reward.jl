function reward(state::State)
  is_reward_cell(state) && return 1, true

  is_damage_cell(state) && return -1, true

  REWARD, false
end
