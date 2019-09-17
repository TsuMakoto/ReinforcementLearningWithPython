@testset "node_value test" begin
  @test Section02.node_value(bad_end_node) == -1.0
  @test Section02.node_value(happy_end_node) == 1.0
  @test Section02.node_value(start_node) == 0.7880942034605892
  @test Section02.node_value(uuud) == 0.78408
  @test Section02.node_value(uu) == 0.9068026334400001
  @test Section02.node_value(dd) == -0.96059601
end

