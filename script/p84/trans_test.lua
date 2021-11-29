-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 208.630890 , 228.719833 , 18.475220 , 40.099960 , [[Camera:ScriptSplineLookAtPosition(186.477,199.956,15);
]] )
   Camera:MotionSpline_AddSplinePoint( 190.477005 , 228.719833 , 21.914883 , 13.900017 , [[Camera:ScriptSplineLookAtPosition(151.573,196.348,15);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 177.365494 , 228.719849 , 21.914707 , 21.000044 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.125717 , 228.719849 , 21.894707 , 30.700081 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 139.125717 , 228.719849 , 21.894707 , 39.999962 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 118.125717 , 228.719849 , 21.894707 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
