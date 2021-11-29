-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 230.667740 , 172.214417 , 15.457493 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(5195);]] )
   Camera:MotionSpline_AddSplinePoint( 234.573669 , 172.794479 , 15.197493 , 5.099998 , [[Camera:ScriptSplineLookAtNpc(5195);
Camera:ScriptSplineModifyCursorSpeed(0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 238.357101 , 171.873291 , 14.397491 , 9.800001 , [[Camera:ScriptSplineLookAtNpc(5195);
Camera:ScriptSplineModifyCursorSpeed(0.5);]] )
   Camera:MotionSpline_AddSplinePoint( 243.205109 , 171.753845 , 15.287508 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5195);
Camera:ScriptSplineModifyCursorSpeed(0.5);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
