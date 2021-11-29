-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 192.298996 , 176.580612 , 42.966400 , 9.400000 , [[Camera:ScriptSplineLookAtPosition(159.328,176.449,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 192.298996 , 176.580612 , 42.966400 , 6.199996 , [[Camera:ScriptSplineLookAtPosition(159.328,176.449,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 192.298996 , 176.580612 , 42.966400 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(159.328,176.449,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 192.298996 , 176.580612 , 42.966400 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(159.328,176.449,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
