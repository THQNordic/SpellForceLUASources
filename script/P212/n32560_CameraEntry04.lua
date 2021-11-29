-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 203.245956 , 20.150387 , 14.800058 , [[Camera:ScriptSplineLookAtPosition(367.964,70.279,25.852)]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 196.086792 , 20.903675 , 10.400068 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 189.957581 , 20.396111 , 05.000074 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 182.957581 , 20.396111 , 00.800077 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
