-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 238.652237 , 273.011017 , 19.169636 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8787);
Camera:ScriptSplineLookAtPosition(188.659,275.764,12.060);]] )
   Camera:MotionSpline_AddSplinePoint( 238.456161 , 273.019897 , 19.169636 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 238.456161 , 273.019897 , 19.169636 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 238.456161 , 273.019897 , 19.169636 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
