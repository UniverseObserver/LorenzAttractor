module Display (display, idle) where

import Graphics.UI.GLUT
import Data.IORef
import Control.Monad
import Lorenz

type Line = [Point]

display :: IORef Line -> IORef GLfloat -> IORef GLfloat -> DisplayCallback
display plot rotation sc = do

    let vertex3f (x, y, z) = vertex $ Vertex3 x y (z :: GLfloat)

    clear [ColorBuffer]
    loadIdentity

    preservingMatrix $ do
        
        r <- get rotation
        s <- get sc
        p <- get plot

        scale s s s
        rotate r $ Vector3 0 1 0

        renderPrimitive LineStrip $ do
            mapM_ vertex3f p
            
    swapBuffers

idle :: IORef Line -> IORef GLfloat  -> IdleCallback
idle plot rotation = do
    plot' <- get plot
    plot $= (lorenz (head plot') : take 999999 plot')
    rotation $~! (+0.06) -- speed of rotation
    postRedisplay Nothing
