-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 514.656555 , 267.641510 , 37.015221 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(4461);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 515.506104 , 265.088135 , 37.515221 , 6.799996 , [[Camera:ScriptSplineLookAtNpc(4461);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 517.357117 , 263.593201 , 38.005219 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 519.291931 , 263.513458 , 39.015221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
