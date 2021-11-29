-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 226.976776 , 265.101471 , 18.977991 , 19.600039 , [[Camera:ScriptSplineLookAtNpc(3383);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 227.527008 , 264.266449 , 18.977991 , 13.000013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 228.077240 , 263.431427 , 18.977991 , 19.500038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 228.627472 , 262.596405 , 18.977991 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
