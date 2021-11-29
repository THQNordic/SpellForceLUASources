-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 198.642990 , 283.342010 , 34.838909 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(194.145,298.473,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 198.643082 , 283.344391 , 34.836357 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(194.145,298.473,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 198.643082 , 283.344421 , 34.836319 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(194.145,298.473,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 198.642715 , 283.345001 , 34.836319 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(194.145,298.473,30.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
