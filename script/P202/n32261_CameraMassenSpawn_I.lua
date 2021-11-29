-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 509.870026 , 383.648743 , 60.301064 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(491.914,398.770,55.757);]] )
   Camera:MotionSpline_AddSplinePoint( 527.677490 , 368.682007 , 67.500252 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 549.578125 , 358.993103 , 73.849434 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 575.318604 , 356.319580 , 81.390930 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
