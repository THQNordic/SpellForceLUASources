-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 304.017365 , 390.628265 , 23.077814 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 305.151276 , 389.783112 , 23.077814 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 306.285187 , 388.937958 , 23.077814 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 307.419098 , 388.092804 , 23.077814 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
