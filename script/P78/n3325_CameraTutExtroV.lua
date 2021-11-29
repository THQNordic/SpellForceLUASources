-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 253.601105 , 266.644379 , 24.956497 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(237.695,267.824,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 252.902634 , 263.666565 , 25.795830 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 251.713043 , 261.410797 , 27.336498 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 248.961411 , 260.034088 , 28.876499 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
