-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 506.039703 , 593.946045 , 13.607970 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 508.713135 , 593.459045 , 13.607970 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 512.516296 , 591.526733 , 13.607970 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 516.040771 , 588.658752 , 13.607970 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
