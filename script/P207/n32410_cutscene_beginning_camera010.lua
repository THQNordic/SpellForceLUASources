-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 407.000000 , 673.700012 , 30.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(405.500,670.500,29.000);]] )
   Camera:MotionSpline_AddSplinePoint( 407.000000 , 673.700012 , 30.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 407.000000 , 673.700012 , 30.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 407.000000 , 673.700012 , 30.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
