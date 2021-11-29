-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 517.361816 , 255.885345 , 40.349670 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3037);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 515.600769 , 254.927185 , 40.259670 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 514.434509 , 254.314102 , 40.209667 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 512.723999 , 253.515533 , 40.119667 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 35.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
