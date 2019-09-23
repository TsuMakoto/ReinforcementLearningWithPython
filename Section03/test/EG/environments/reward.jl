@testset "reward function test" begin
  @test EpsilonGreedy.reward(0.01; r=0.02) == 0.0
  @test EpsilonGreedy.reward(0.3; r=0.2) == 1.0
end
