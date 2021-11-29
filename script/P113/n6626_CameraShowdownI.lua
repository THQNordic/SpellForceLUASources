-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 223.206467 , 262.586670 , 42.867676 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(210.387,317.098,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 203.591324 , 261.919495 , 42.907536 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 188.856491 , 266.136719 , 42.827698 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 170.641342 , 279.973511 , 38.817719 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
