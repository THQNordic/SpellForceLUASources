-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.254456 , 459.779358 , 80.406258 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(3865);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 403.546570 , 459.975067 , 79.496254 , 13.200014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 408.309448 , 462.781494 , 78.506248 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 414.391022 , 470.200897 , 77.206253 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
