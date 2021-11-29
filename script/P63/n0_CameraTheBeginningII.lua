-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 99.184784 , 373.114502 , 34.835777 , 30.900082 , [[Camera:ScriptSplineLookAtNpc(3107);
	Camera:ScriptSplineAddTargetLookAtOffset(0,0,2);]] )
   Camera:MotionSpline_AddSplinePoint( 96.634140 , 373.157593 , 33.556690 , 9.500000 , [[Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 93.385185 , 371.201752 , 32.866692 , 17.700031 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 91.491661 , 365.856262 , 34.281284 , 23.100052 , [[Camera:ScriptSplineLookAtNpc(2916); Camera:ScriptSplineLookAtApproachingModifier(0.005);
   Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 89.795792 , 362.021790 , 33.836498 , 30.800081 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 89.428940 , 355.574219 , 34.756500 , 0.000000 , [[Camera:ScriptSplineModifyCursorSpeed(0.5);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
