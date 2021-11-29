-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 546.142151 , 539.119202 , 72.613678 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(552.734,550.559,71.740);]] )
   Camera:MotionSpline_AddSplinePoint( 551.136841 , 537.279602 , 71.613678 , 10.400003 , [[Camera:ScriptSplineLookAtPosition(552.890,553.598,78.050);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 557.963074 , 537.812927 , 71.503677 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 562.461121 , 540.463501 , 70.993675 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
