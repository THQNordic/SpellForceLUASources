-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 440.700073 , 339.700439 , 23.033876 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(380.871,392.053,40.910);]] )
   Camera:MotionSpline_AddSplinePoint( 445.965790 , 342.499237 , 23.503876 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 449.096680 , 349.130096 , 22.964962 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 449.950958 , 358.148804 , 23.323900 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
