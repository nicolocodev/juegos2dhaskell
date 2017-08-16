module UserInput (userinput) where

  import Graphics.Gloss

  import Graphics.Gloss.Interface.Pure.Game

  import Graphics.Gloss.Data.ViewPort

  -- | Number of frames to show per second.
  fps :: Int
  fps = 80

  type Pos = (Float, Float)

  data GameState = GameState
    { loc :: Pos
     ,paused:: Bool
    }

  initialState :: GameState
  initialState = GameState {loc = (60,60), paused = False}

  render :: GameState -> Picture
  render game =
    pictures [ball]
    where
      ball = uncurry translate (loc game) $ color red $ circleSolid 10

  window :: Display
  window = InWindow "Nice Window" (640, 480) (90, 90)

  background :: Color
  background = white

  drawing :: Picture
  drawing = circle 100

  -- | Update the ball position using its current velocity.
  moveBall :: Float    -- ^ The number of seconds since last update
         -> GameState -- ^ The initial game state
         -> GameState -- ^ A new game state with an updated ball position
  moveBall seconds game = game { loc = (x, y') }
    where
      -- Old locations and velocities.
      (x, y) = loc game
      -- New locations.
      y' = y + 10 * seconds

  -- Ahora update toma un float
  update :: Float -> GameState -> GameState
  update seconds game | paused game = game
                      | otherwise = moveBall seconds game

  handleKeys :: Event -> GameState -> GameState
  handleKeys (EventKey (Char 'p') Down _ _) game = game { paused = not (paused game) }
  handleKeys _ game = game

  userinput :: IO ()
  userinput = play window background fps initialState render handleKeys update
