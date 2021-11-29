-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 349.543976 , 579.817444 , 52.250549 , 14.900021 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineAddTargetLookAtOffset(0,0,-1.0);]] )
   Camera:MotionSpline_AddSplinePoint( 391.046204 , 537.796875 , 45.260563 , 10.900005 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineAddTargetLookAtOffset(0,0,-1.0);]] )
   Camera:MotionSpline_AddSplinePoint( 452.934540 , 569.269531 , 44.340561 , 14.800020 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineAddTargetLookAtOffset(0,0,-1.0);]] )
   Camera:MotionSpline_AddSplinePoint( 480.816895 , 607.317810 , 36.441341 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineAddTargetLookAtOffset(0,0,-1.0);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 1.210938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
