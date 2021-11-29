-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 535.270081 , 335.375427 , 31.194088 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(556.868,346.900,37.600);]] )
   Camera:MotionSpline_AddSplinePoint( 528.245605 , 333.764099 , 27.904091 , 5.199997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 517.927979 , 333.660706 , 25.584145 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 501.393311 , 344.425049 , 24.444090 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
