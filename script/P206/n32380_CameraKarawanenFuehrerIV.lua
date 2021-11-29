-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 342.066315 , 318.082947 , 60.826111 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(373.952,347.484,33.000);]] )
   Camera:MotionSpline_AddSplinePoint( 361.158142 , 289.082947 , 60.685707 , 10.500004 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 393.536621 , 291.897827 , 60.275024 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 408.844818 , 315.685638 , 60.472702 , 19.800039 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.664063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
