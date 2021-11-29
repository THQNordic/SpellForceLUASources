-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 521.401062 , 497.250854 , 69.726746 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(540.438,510.022,70.020);]] )
   Camera:MotionSpline_AddSplinePoint( 519.353210 , 498.870758 , 69.726746 , 12.400011 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 518.105774 , 500.592651 , 69.726746 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 517.607300 , 505.526184 , 68.756760 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
