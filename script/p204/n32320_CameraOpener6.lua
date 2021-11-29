-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 383.706421 , 448.742340 , 58.596905 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9721);]] )
   Camera:MotionSpline_AddSplinePoint( 383.369843 , 446.059662 , 58.578754 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.643250 , 442.877411 , 59.578754 , 12.900013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 380.642975 , 441.699249 , 59.578754 , 7.799995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 377.924561 , 442.908112 , 59.578754 , 14.900021 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
