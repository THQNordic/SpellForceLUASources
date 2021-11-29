-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 297.364471 , 184.228958 , 21.706171 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 295.967316 , 182.546539 , 21.876167 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 294.829712 , 181.192764 , 21.846172 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 294.484985 , 179.799683 , 21.676170 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
