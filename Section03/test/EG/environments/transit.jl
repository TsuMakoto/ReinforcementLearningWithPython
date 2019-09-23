@testset "transit function test" begin
  @test EpsilonGreedy.transit(agent_finish(), action_1; r=0.2) == (0.0, true)
  @test EpsilonGreedy.transit(agent_continue(), action_2; r=0.1) == (1.0, false)
end
