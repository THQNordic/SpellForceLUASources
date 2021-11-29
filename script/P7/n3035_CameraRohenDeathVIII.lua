-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 65.737396 , 46.347034 , 42.530140 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(70.235,55.878,42.270);]] )
   Camera:MotionSpline_AddSplinePoint( 68.980263 , 45.020161 , 42.270142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 73.306374 , 44.734394 , 42.060230 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 77.261688 , 46.547855 , 42.060143 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
