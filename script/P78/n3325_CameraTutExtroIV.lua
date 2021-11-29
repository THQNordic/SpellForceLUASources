-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 256.824707 , 269.040405 , 17.047375 , 29.700077 , [[Camera:ScriptSplineLookAtPosition(250.339,267.453,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 256.746277 , 266.635468 , 17.057356 , 19.700039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 256.698578 , 264.233063 , 17.207373 , 29.600077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 256.677307 , 261.828857 , 17.447372 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
