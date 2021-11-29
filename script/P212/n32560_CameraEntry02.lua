-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 121.097748 , 294.245667 , 40.810532 , 20.100000 , [[Camera:ScriptSplineLookAtPosition(100.204,327.246,25.000);]] )
   Camera:MotionSpline_AddSplinePoint( 121.594566 , 290.480164 , 40.810532 , 15.100000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 122.505013 , 285.983368 , 40.810532 , 10.100040 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 123.001831 , 282.217865 , 40.810532 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.520313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
