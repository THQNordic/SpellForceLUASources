-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 472.691406 , 355.352295 , 27.860569 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(4177);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,3);]] )
   Camera:MotionSpline_AddSplinePoint( 468.123077 , 358.853821 , 27.160572 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 460.520172 , 360.057404 , 26.560570 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);
Camera:ScriptSplineCutSceneApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 454.346832 , 357.621674 , 25.500570 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
