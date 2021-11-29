-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 400.009430 , 65.284172 , 24.616493 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6991);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,4.4);]] )
   Camera:MotionSpline_AddSplinePoint( 400.009430 , 65.284172 , 24.616493 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 400.009430 , 65.284172 , 24.616493 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 400.009430 , 65.284172 , 24.616493 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
