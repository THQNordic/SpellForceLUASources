-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 111.120926 , 456.631531 , 24.161180 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(88.876,449.613,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 121.947113 , 458.283569 , 22.971380 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 136.851425 , 456.822540 , 18.382536 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.227615 , 460.237061 , 16.281179 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
