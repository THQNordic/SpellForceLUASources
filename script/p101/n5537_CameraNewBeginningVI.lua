-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 54.071415 , 84.784706 , 26.781025 , 8.099995 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 54.071415 , 84.784706 , 25.781025 , 5.299997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 54.071415 , 84.784706 , 25.781025 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 54.071415 , 84.784706 , 25.781025 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
