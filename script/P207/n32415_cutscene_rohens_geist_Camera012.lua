-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 387.217102 , 52.834980 , 92.290543 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(383.505,58.173,88.900);]] )
   Camera:MotionSpline_AddSplinePoint( 387.217102 , 52.834980 , 92.290543 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 387.217102 , 52.834980 , 92.290543 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 387.217102 , 52.834980 , 92.290543 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
