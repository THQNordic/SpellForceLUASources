-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 91.436371 , 357.560791 , 30.426689 , 45.999870 , [[Camera:ScriptSplineLookAtPosition(93.750,362.699,31.240);
   Camera:ScriptSplineModifyCursorSpeed(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 91.436333 , 352.213867 , 31.286671 , 39.299973 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 91.436333 , 347.071320 , 34.086693 , 45.899872 , [[Camera:ScriptSplineLookAtPosition(106.136,343.279,32.160);
Camera:ScriptSplineLookAtApproachingModifier(0.01);
Camera:ScriptSplineModifyCursorSpeed(0.2);]] )
   Camera:MotionSpline_AddSplinePoint( 91.436333 , 342.815674 , 36.003326 , 0.000000 , [[Camera:ScriptSplineModifyCursorSpeed(0.05);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 46.000000 )
   Camera:MotionSpline_SetCorrection( 153.164063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
