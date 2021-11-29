-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 93.692673 , 416.363190 , 41.866169 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6672);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 94.394058 , 421.971405 , 43.152714 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 96.278603 , 425.199921 , 44.152714 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 101.070747 , 427.822357 , 45.152714 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
