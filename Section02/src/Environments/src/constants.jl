# constants of game
const MOVE_PROB = 0.8
const DEFAULT_REWARD = -0.04
const ORDINARY = 0
const DAMAGE = -1
const REWARD = 1
const BLOCK = 9
const X_RANGE = 1:4
const Y_RANGE = 1:3
const GRID = [
                ORDINARY ORDINARY ORDINARY ORDINARY
                ORDINARY BLOCK ORDINARY DAMAGE
                ORDINARY ORDINARY ORDINARY REWARD
             ]

# constants of action
const UP = 1
const MOVE_UP = (0, 1)
const DOWN = -1
const MOVE_DOWN = (0, -1)
const RIGHT = 2
const MOVE_RIGHT = (1, 0)
const LEFT = -2
const MOVE_LEFT = (-1, 0)
const DIRS = [UP, DOWN, LEFT, RIGHT]
const DIRECTIONS = Dict(
                        UP => MOVE_UP,
                        DOWN => MOVE_DOWN,
                        LEFT => MOVE_LEFT,
                        RIGHT => MOVE_RIGHT
                       )

# constants of state
const CANNOT_MOVE = "Can't move from here!"
const CONTINUE = "continue"
const REWARD_CELL_MESSAGE = "reward"
const DAMEGE_CELL_MESSAGE = "damage"
