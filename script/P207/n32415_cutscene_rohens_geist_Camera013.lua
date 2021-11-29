-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 383.582825 , 56.993561 , 92.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(382.164,61.962,88.800);]] )
   Camera:MotionSpline_AddSplinePoint( 383.582825 , 56.993561 , 92.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.582825 , 56.993561 , 92.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.582825 , 56.993561 , 92.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
