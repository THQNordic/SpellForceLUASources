-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 124.655212 , 225.607712 , 45.641148 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(133.494,246.020,34.010);]] )
   Camera:MotionSpline_AddSplinePoint( 127.680801 , 224.476624 , 45.149429 , 20.400042 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 132.310104 , 223.834412 , 44.811153 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 136.835648 , 224.341736 , 44.971111 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
