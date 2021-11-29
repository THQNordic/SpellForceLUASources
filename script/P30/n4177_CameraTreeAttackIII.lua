-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 469.690308 , 353.137451 , 29.602486 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(4177);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,3);]] )
   Camera:MotionSpline_AddSplinePoint( 469.103424 , 354.544983 , 29.232485 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 467.911072 , 356.762878 , 26.872486 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 465.772980 , 360.004822 , 26.652485 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
