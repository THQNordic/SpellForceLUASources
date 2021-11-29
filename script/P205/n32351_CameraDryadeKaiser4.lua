-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 308.782684 , 394.220795 , 15.418242 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9320);]] )
   Camera:MotionSpline_AddSplinePoint( 309.417236 , 394.993683 , 15.418242 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 310.166687 , 395.655731 , 15.418242 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 310.801239 , 396.428619 , 15.418242 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
