import Graphics.UI.GLUT
import Data.IORef
import Display

main :: IO ()
main = do
    (_progName, _args) <- getArgsAndInitialize
    _window <- createWindow "Lorenz System"
    initialDisplayMode $= [DoubleBuffered]

    plot     <- newIORef [(1.0, 1.0, 1.0)]  -- init 
    rotation <- newIORef 0
    scale    <- newIORef 0.025

    idleCallback    $= Just (idle plot rotation)
    displayCallback $= display plot rotation scale

    mainLoop


