-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 411.970093 , 158.861404 , 95.490105 , 45.099884 , [[Camera:ScriptSplineLookAtPosition(414.917,203.333,47.114);]] )
   Camera:MotionSpline_AddSplinePoint( 411.970093 , 158.861404 , 95.490105 , 25.700062 , [[Camera:ScriptSplineLookAtPosition(414.917,203.333,47.114);]] )
   Camera:MotionSpline_AddSplinePoint( 411.970093 , 158.861404 , 95.490105 , 44.999886 , [[Camera:ScriptSplineLookAtPosition(414.917,203.333,47.114);]] )
   Camera:MotionSpline_AddSplinePoint( 411.970093 , 158.861404 , 95.490105 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(414.917,203.333,47.114);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 45.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
