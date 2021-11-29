-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 326.864655 , 233.832092 , 33.770390 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(369.675,162.215,20.090);]] )
   Camera:MotionSpline_AddSplinePoint( 355.864655 , 210.832092 , 20.770390 , 25.300018 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 368.677094 , 183.245956 , 20.150387 , 20.800058 , [[Camera:ScriptSplineLookAtPosition(367.964,70.279,25.852);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 367.195709 , 133.086792 , 30.903675 , 15.400068 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 120.957581 , 29.396111 , 10.000074 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 115.957581 , 29.396111 , 5.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 113.957581 , 29.396111 , 3.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 367.300323 , 111.957581 , 29.396111 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
