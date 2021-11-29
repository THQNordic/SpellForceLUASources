-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 375.581909 , 506.648102 , 28.900244 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(378.290,449.821,29.000);]] )
   Camera:MotionSpline_AddSplinePoint( 369.965942 , 481.572632 , 29.842400 , 15.700024 , [[Camera:ScriptSplineLookAtPosition(378.290,449.821,29.000);]] )
   Camera:MotionSpline_AddSplinePoint( 391.879639 , 468.630951 , 33.325420 , 19.800039 , [[Camera:ScriptSplineLookAtPosition(378.290,449.821,29.000);]] )
   Camera:MotionSpline_AddSplinePoint( 400.413940 , 472.584473 , 52.378517 , 19.800039 , [[Camera:ScriptSplineLookAtPosition(378.290,449.821,29.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
