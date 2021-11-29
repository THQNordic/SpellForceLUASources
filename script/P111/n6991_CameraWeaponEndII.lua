-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 387.676514 , 64.030029 , 23.817419 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(404.011,68.228,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 391.294952 , 63.228779 , 18.817419 , 14.600019 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 393.136719 , 62.283531 , 18.817419 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 396.106049 , 61.886013 , 18.317419 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
