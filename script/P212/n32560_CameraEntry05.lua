-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 120.957581 , 29.396111 , 14.800058 , [[Camera:ScriptSplineLookAtPosition(367.964,70.279,25.852)]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 115.957581 , 29.396111 , 10.400068 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 110.957581 , 29.396111 , 05.000074 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 105.957581 , 29.396111 , 00.800077 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
