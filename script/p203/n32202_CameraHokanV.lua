-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 687.187317 , 524.913269 , 20.000000 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(666.378,552.943,13.390);]] )
   Camera:MotionSpline_AddSplinePoint( 696.495789 , 534.720215 , 20.000000 , 6.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 698.507629 , 550.634155 , 20.000000 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 692.143250 , 562.486694 , 20.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
