module BasicCircle (displaywindow) where

  import Graphics.Gloss

  window :: Display
  window = InWindow "Nice Window" (200, 200) (10, 10)

  background :: Color
  background = white

  drawing :: Picture
  drawing = circle 80

  displaywindow :: IO ()
  displaywindow = display window background drawing
