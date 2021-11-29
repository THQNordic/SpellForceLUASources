-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 152.462662 , 203.801605 , 14.091427 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(176.111,199.216,17.808);]] )
   Camera:MotionSpline_AddSplinePoint( 153.057953 , 196.078476 , 13.131531 , 9.099998 , [[Camera:ScriptSplineLookAtPosition(176.111,199.216,20.808);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 157.976913 , 190.912949 , 13.151426 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 166.411667 , 186.828247 , 13.480825 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
