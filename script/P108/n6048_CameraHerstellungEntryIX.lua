-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 665.341736 , 372.132813 , 21.095221 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6304);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1);]] )
   Camera:MotionSpline_AddSplinePoint( 665.531982 , 369.151184 , 23.095221 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 665.722839 , 367.169556 , 24.095221 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 669.049438 , 363.778870 , 28.095221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
