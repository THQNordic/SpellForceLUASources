-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.562592 , 229.233444 , 103.710281 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(6654);]] )
   Camera:MotionSpline_AddSplinePoint( 399.021545 , 238.973526 , 100.700287 , 10.800005 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 394.702026 , 253.907883 , 102.271805 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.945007 , 267.004242 , 111.612900 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
