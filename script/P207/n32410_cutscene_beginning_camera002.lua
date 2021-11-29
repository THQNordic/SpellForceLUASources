-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.000000 , 672.000000 , 33.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(384.320,460.379,45.000);]] )
   Camera:MotionSpline_AddSplinePoint( 402.000000 , 672.000000 , 32.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 406.000000 , 672.000000 , 31.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 410.000000 , 672.000000 , 30.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
