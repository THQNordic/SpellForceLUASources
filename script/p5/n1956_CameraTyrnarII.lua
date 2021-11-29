-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 228.880417 , 445.025024 , 41.034595 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(280.436,503.054,33.000);]] )
   Camera:MotionSpline_AddSplinePoint( 231.528198 , 442.367035 , 41.234562 , 4.699998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.176270 , 439.708771 , 42.814529 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 239.427536 , 434.437317 , 46.774597 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
