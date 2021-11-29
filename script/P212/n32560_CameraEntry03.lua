-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 87.231827 , 512.795898 , 40.846851 , 19.900000 , [[Camera:ScriptSplineLookAtPosition(60.640,559.819,24.150);]] )
   Camera:MotionSpline_AddSplinePoint( 92.302711 , 514.595398 , 40.846851 , 12.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 97.174995 , 517.408264 , 40.846851 , 6.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 101.834763 , 522.179382 , 40.846851 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.520313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
