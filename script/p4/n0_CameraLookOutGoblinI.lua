-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 199.223831 , 260.940369 , 39.545574 , 11.900009 , [[Camera:ScriptSplineLookAtNpc(3108);]] )
   Camera:MotionSpline_AddSplinePoint( 215.527710 , 242.389969 , 40.925568 , 6.699996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 231.623199 , 273.661377 , 33.453453 , 8.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 229.145493 , 290.621460 , 42.455719 , 10.000002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.353790 , 299.665253 , 45.405720 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 247.614456 , 308.280487 , 40.295746 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.898438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
