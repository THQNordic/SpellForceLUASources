-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 405.524048 , 269.642273 , 29.022476 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(404.975,277.693,28.990);]] )
   Camera:MotionSpline_AddSplinePoint( 407.137726 , 245.440903 , 33.907124 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 407.463379 , 238.570892 , 33.907124 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 407.813293 , 233.678909 , 33.907124 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
