@testset "state's update_Ex function test" begin
  @test EpsilonGreedy.update_Ex(state01(), 1, 1.0) == 2.0
end
