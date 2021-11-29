-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 241.906830 , 533.984436 , 17.766426 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(249.976,525.250,10.080);]] )
   Camera:MotionSpline_AddSplinePoint( 240.788773 , 533.137329 , 16.611717 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 239.986008 , 531.951416 , 16.531717 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 237.191986 , 530.389282 , 16.262030 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
