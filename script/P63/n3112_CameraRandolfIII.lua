-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 198.127792 , 349.746460 , 33.376495 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3112);]]) --[[Camera:ScriptSplineLookAtPosition(193.656,350.246,36.360);]] )
   Camera:MotionSpline_AddSplinePoint( 198.127792 , 349.746460 , 34.376495 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 198.127792 , 349.746460 , 35.376495 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 198.127792 , 349.746460 , 36.376495 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
