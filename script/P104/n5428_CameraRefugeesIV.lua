-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 652.720947 , 67.681313 , 21.980001 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(631.016,107.499,24.000);]] )
   Camera:MotionSpline_AddSplinePoint( 649.689026 , 71.644127 , 26.980001 , 24.900059 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 646.299561 , 76.740562 , 25.980001 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 644.750000 , 79.305992 , 27.119987 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
