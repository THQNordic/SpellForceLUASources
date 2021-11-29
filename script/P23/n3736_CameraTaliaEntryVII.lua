-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 129.586273 , 329.475494 , 32.482624 , 29.700077 , [[Camera:ScriptSplineLookAtPosition(111.853,333.598,30.410);]] )
   Camera:MotionSpline_AddSplinePoint( 131.585114 , 329.647522 , 32.482620 , 19.700039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 133.430359 , 329.806335 , 32.442631 , 29.600077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 135.313965 , 329.968506 , 32.692467 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
