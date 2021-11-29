-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 544.584167 , 138.745529 , 7.086343 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(542.608,144.642,7.200);]] )
   Camera:MotionSpline_AddSplinePoint( 544.115601 , 139.988419 , 7.066342 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 543.745117 , 140.971024 , 7.066342 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 543.195984 , 142.427856 , 7.146294 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
