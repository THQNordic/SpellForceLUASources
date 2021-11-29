-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 455.516937 , 529.608521 , 21.874271 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(5462);]] )
   Camera:MotionSpline_AddSplinePoint( 456.702545 , 532.460205 , 20.714272 , 7.299995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 455.111725 , 536.731384 , 18.000084 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 452.672211 , 539.446960 , 16.980080 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
