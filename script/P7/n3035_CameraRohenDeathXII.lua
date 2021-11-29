-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 58.105160 , 42.141132 , 42.845348 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(71.076,55.656,40.270);]] )
   Camera:MotionSpline_AddSplinePoint( 62.248253 , 39.844833 , 42.287346 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 65.258980 , 39.147541 , 41.885349 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 67.611641 , 39.190338 , 41.765182 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
