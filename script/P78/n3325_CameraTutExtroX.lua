-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 252.812775 , 263.557343 , 18.105305 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(245.195,269.971,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 252.812775 , 263.557343 , 18.105305 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 252.812775 , 263.557343 , 18.105305 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 252.812775 , 263.557343 , 18.105305 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
