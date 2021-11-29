-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 514.437683 , 243.134995 , 43.184906 , 29.900078 , [[Camera:ScriptSplineLookAtNpc(4461);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 511.365723 , 242.272400 , 43.444881 , 21.100044 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 507.136963 , 241.701050 , 42.534904 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 503.063507 , 241.909286 , 40.494904 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
