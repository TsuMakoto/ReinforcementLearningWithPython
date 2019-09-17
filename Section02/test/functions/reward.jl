@testset "reward test" begin
  @test Section02.reward(start_node) == 0
  @test Section02.reward(bad_end_node) == -1
  @test Section02.reward(happy_end_node) == 1
end
