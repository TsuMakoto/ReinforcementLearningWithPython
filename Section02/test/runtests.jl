using Section02
using Test

start_node = Node(State(Section02.CONTINUE), Section02.START_PROB, [])

bad_end_node = Node(
                    State(Section02.BAD_END),
                    Section02.MOVE_PROB,
                    [Action(Section02.RIGHT),
                     Action(Section02.UP),
                     Action(Section02.UP),
                     Action(Section02.UP),
                     Action(Section02.LEFT)]
                   )

happy_end_node = Node(
                      State(Section02.HAPPY_END),
                      Section02.MOVE_PROB,
                      [Action(Section02.UP),
                       Action(Section02.UP),
                       Action(Section02.UP),
                       Action(Section02.UP),
                       Action(Section02.RIGHT)]
                     )

uuud = Node(
            State(Section02.CONTINUE),
            Section02.MOVE_PROB,
            [Action(Section02.UP),
             Action(Section02.UP),
             Action(Section02.UP),
             Action(Section02.DOWN)]
           )

uu =  Node(
           State(Section02.CONTINUE),
           Section02.MOVE_PROB,
           [Action(Section02.UP),
            Action(Section02.UP)]
          )

dd =  Node(
           State(Section02.CONTINUE),
           Section02.MOVE_PROB,
           [Action(Section02.DOWN),
            Action(Section02.DOWN)]
          )

# start test
include("./functions/transit.jl")
include("./functions/reward.jl")
include("./functions/node_value.jl")
