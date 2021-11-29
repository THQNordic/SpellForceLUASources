-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 188.939453 , 582.413330 , 61.943237 , 29.900078 , [[Camera:ScriptSplineLookAtNpc(3354);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 194.873718 , 579.775513 , 62.951817 , 9.500000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 201.648605 , 575.418823 , 64.151810 , 15.500023 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 206.030197 , 567.601440 , 64.866692 , 26.100063 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 200.675720 , 553.774536 , 72.123230 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 197.415543 , 550.020508 , 75.103233 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
