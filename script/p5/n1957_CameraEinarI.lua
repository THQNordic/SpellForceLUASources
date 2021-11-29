-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 210.265030 , 593.569336 , 44.673161 , 15.600023 , [[Camera:ScriptSplineLookAtNpc(1957);]] )
   Camera:MotionSpline_AddSplinePoint( 210.265030 , 593.569336 , 44.673161 , 10.300003 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 210.265030 , 593.569336 , 44.673161 , 15.500023 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 210.265030 , 593.569336 , 44.673161 , 6.099998 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 16.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
