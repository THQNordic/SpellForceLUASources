-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 78.917076 , 111.699066 , 42.041286 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(60.157,116.608,35.000);]] )
   Camera:MotionSpline_AddSplinePoint( 82.497780 , 116.048531 , 38.041290 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 83.645058 , 118.383934 , 36.482319 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 84.229660 , 120.536751 , 36.150726 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
