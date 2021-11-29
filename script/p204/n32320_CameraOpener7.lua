-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 384.711609 , 452.646759 , 57.417641 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(9721);]] )
   Camera:MotionSpline_AddSplinePoint( 384.767914 , 444.341675 , 57.417641 , 8.099995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.427032 , 444.688080 , 57.417641 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 380.834717 , 445.725220 , 56.859451 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
