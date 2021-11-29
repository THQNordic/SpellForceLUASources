-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 495.474152 , 143.794678 , 17.858517 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(494.667,167.551,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 497.037415 , 143.748154 , 17.858517 , 11.600008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 500.783600 , 143.636673 , 17.858517 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 504.532745 , 143.525101 , 17.858517 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
