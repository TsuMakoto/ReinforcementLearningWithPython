reward_cell = State(4, 3, 11, Environments.REWARD_CELL_MESSAGE)
damage_cell = State(4, 2, 7, Environments.DAMEGE_CELL_MESSAGE)
ordinary_cell = State(1, 1, 0, Environments.CONTINUE)

@testset "reward test" begin
  @test Environments.reward(reward_cell) == (1, true)
  @test Environments.reward(damage_cell) == (-1, true)
  @test Environments.reward(ordinary_cell) == (Environments.REWARD, false)
end
