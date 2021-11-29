-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 450.739166 , 557.290222 , 28.010193 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(527.068,466.619,20.820);]] )
   Camera:MotionSpline_AddSplinePoint( 460.284363 , 527.606323 , 30.537935 , 14.400019 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 476.998779 , 516.281372 , 33.089436 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 483.217865 , 499.771301 , 33.492622 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
