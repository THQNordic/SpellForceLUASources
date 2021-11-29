-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 387.278625 , 388.012299 , 11.516403 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(355.062,502.368,35.458);
Camera:ScriptSplineModifyCursorSpeedModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 377.459839 , 386.093201 , 10.388065 , 1.900000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.08);
Camera:ScriptSplineLookAtNpc(9250);
]] )
   Camera:MotionSpline_AddSplinePoint( 369.026215 , 393.875458 , 9.332870 , 3.599999 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 359.572357 , 396.449829 , 9.534924 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 323.873230 , 393.225128 , 17.553919 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
