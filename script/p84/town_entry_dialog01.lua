-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 97.178741 , 149.744293 , 17.996195 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(108.970,154.013,14.500);]] )
   Camera:MotionSpline_AddSplinePoint( 99.178741 , 149.744293 , 16.996195 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 101.178741 , 149.744293 , 15.996195 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 103.178741 , 149.744293 , 14.996195 , 19.900040 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
