Q = Dict(1 => [1.3, 2.9, 0.8])
ϵ = 0.2
@testset "Q Learning test that policy function" begin
  @test QLearning.policy(QLearning.Agent(Q, ϵ),
                         QLearning.State(1),
                         [QLearning.Action(), QLearning.Action()];
                         r=0.1,
                         act_idx=1) == 1

  @test QLearning.policy(QLearning.Agent(Q, ϵ),
                         QLearning.State(1),
                         [QLearning.Action(), QLearning.Action()];
                         r=0.3
                        ) == 2

end
