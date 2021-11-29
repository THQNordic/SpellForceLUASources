-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 192.996735 , 291.591156 , 34.712387 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(207.508,308.549,24.090);]] )
   Camera:MotionSpline_AddSplinePoint( 195.175995 , 290.127258 , 34.702385 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 197.462357 , 288.591431 , 34.782379 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 202.020721 , 285.529388 , 35.122372 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
