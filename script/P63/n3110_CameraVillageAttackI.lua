-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 395.040009 , 232.389526 , 38.484528 , 11.900009 , [[Camera:ScriptSplineLookAtPosition(414.886,246.946,33.480);]] )
   Camera:MotionSpline_AddSplinePoint( 403.009491 , 235.218399 , 35.431171 , 11.000006 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 408.013641 , 238.014420 , 35.011173 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 408.013641 , 238.014420 , 35.011173 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
