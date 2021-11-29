-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 180.502670 , 347.226013 , 35.652279 , 29.700077 , [[Camera:ScriptSplineLookAtNpc(2916);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 178.698990 , 347.419159 , 35.812279 , 16.500027 , [[Camera:ScriptSplineLookAtNpc(2916);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 176.915344 , 347.797455 , 36.412231 , 29.600077 , [[Camera:ScriptSplineLookAtNpc(2916);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 175.451172 , 348.353058 , 36.619884 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(2916);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
