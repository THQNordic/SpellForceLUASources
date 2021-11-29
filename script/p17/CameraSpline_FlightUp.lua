-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 1 )
   Camera:MotionSpline_SetSlowDown( 0.500000 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.683167 , 131.934311 , 35.183228 )
   Camera:MotionSpline_AddSplinePoint( 398.831177 , 150.862411 , 61.796402 )
   Camera:MotionSpline_AddSplinePoint( 406.352112 , 169.046646 , 91.536400 )
   Camera:MotionSpline_AddSplinePoint( 429.109070 , 196.747528 , 102.509583 )
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
