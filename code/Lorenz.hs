module Lorenz where

import Graphics.UI.GLUT

type Point = (GLfloat, GLfloat, GLfloat)

lorenz :: Point -> Point
lorenz (x, y, z) =  ( x + (sigma * (y - x))   * speed 
                    , y + (x * (rho - z) - y) * speed 
                    , z + (x * y - beta * z ) * speed )
    where   speed   = 0.004 -- speed of tracing 
            rho     = 28.0
            sigma   = 10.0
            beta    = 8.0 / 3.0 
   