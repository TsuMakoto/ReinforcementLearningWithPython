one_x_one = Node(
              State(1, 1, 0, "continue"),
              Environments.MOVE_PROB,
              []
             )
act = Action(Environments.UP, Environments.MOVE_UP[1], Environments.MOVE_UP[2])
result = [
          Node(
               State(1, 2, 4, Environments.CONTINUE),
               0.8,
               [
                Action(
                       Environments.UP,
                       Environments.MOVE_UP[1],
                       Environments.MOVE_UP[2]
                      )
               ]
              ),
          Node(
               State(2, 1, 1, Environments.CONTINUE),
               0.09999999999999998,
               [
                Action(
                       Environments.RIGHT,
                       Environments.MOVE_RIGHT[1],
                       Environments.MOVE_RIGHT[2])
               ]
              ),
        ]

check(src::Array{Node, 1}, dst::Array{Node, 1})::Bool = begin
  if length(src) ≠ length(dst)
    return false
  end

  for i ∈ 1:length(src)
    src[i].state.x ≠ dst[i].state.x && return false
    src[i].state.y ≠ dst[i].state.y && return false
    src[i].state.cell_number ≠ dst[i].state.cell_number && return false
    src[i].state.status ≠ dst[i].state.status && return false

    src[i].prob ≠ dst[i].prob && return false

    length(src[i].root) ≠ length(dst[i].root) && return false
    for j = 1:length(src[i].root)
      src[i].root[j].direction ≠ dst[i].root[j].direction && return false
      src[i].root[j].move_x ≠ dst[i].root[j].move_x && return false
      src[i].root[j].move_y ≠ dst[i].root[j].move_y && return false
    end
  end
  true
end

@testset "transit test" begin
  @test check(Environments.children(one_x_one, act), result)
end
