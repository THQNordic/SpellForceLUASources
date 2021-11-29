-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 223.955658 , 508.045624 , 52.616402 , 15.900024 , [[Camera:ScriptSplineLookAtPosition(242.691,552.456,37.000);]] )
   Camera:MotionSpline_AddSplinePoint( 240.069870 , 497.185455 , 49.598076 , 10.300003 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 259.166077 , 500.364380 , 45.886398 , 15.800024 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 273.166077 , 516.360229 , 42.936363 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 16.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
