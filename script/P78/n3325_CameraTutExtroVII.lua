-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 266.427216 , 262.073792 , 24.956497 , 30.900082 , [[Camera:ScriptSplineLookAtPosition(248.814,266.155,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 262.745605 , 257.926300 , 25.795830 , 21.300045 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 257.744965 , 254.351654 , 27.336498 , 30.800081 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 253.142456 , 252.139786 , 28.876499 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
