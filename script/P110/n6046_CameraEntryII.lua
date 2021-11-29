-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 50.998379 , 536.379150 , 59.311066 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(72.601,540.930,45.160);]] )
   Camera:MotionSpline_AddSplinePoint( 54.655102 , 530.182251 , 59.011074 , 10.300003 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 62.155640 , 522.798584 , 58.841049 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 76.698074 , 515.048462 , 58.951172 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
