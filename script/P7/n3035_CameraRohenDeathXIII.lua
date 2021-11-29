-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 70.471855 , 54.592854 , 41.899807 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(4185);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 68.514427 , 50.301945 , 41.929790 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 73.147316 , 45.616653 , 41.739822 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 94.231789 , 28.567791 , 41.738110 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
