-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 361.210205 , 248.921143 , 24.282909 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 362.486908 , 250.278732 , 24.782909 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 363.012634 , 250.837753 , 24.782909 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 363.585480 , 251.446899 , 24.782909 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 13.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
