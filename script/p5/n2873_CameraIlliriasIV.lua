-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 425.478546 , 188.831604 , 68.769455 , 29.900078 , [[Camera:ScriptSplineLookAtNpc(1957);]] )
   Camera:MotionSpline_AddSplinePoint( 426.699799 , 184.800812 , 68.609459 , 22.200048 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.017059 , 177.152695 , 68.619461 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 430.212189 , 173.208115 , 68.759460 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
