-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 210.371124 , 332.759583 , 37.654430 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(215.238,311.024,37.000);]] )
   Camera:MotionSpline_AddSplinePoint( 210.226486 , 334.471405 , 45.196877 , 10.300003 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 210.218582 , 334.564850 , 50.293816 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 210.049362 , 336.567413 , 55.532501 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
