-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 571.392395 , 560.747559 , 76.206398 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(547.400,578.308,65.000);]] )
   Camera:MotionSpline_AddSplinePoint( 563.600464 , 557.500610 , 78.909843 , 18.700035 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 555.319580 , 555.376282 , 80.486351 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 545.222046 , 557.680115 , 80.036499 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
