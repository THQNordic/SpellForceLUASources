-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 1 )
   Camera:MotionSpline_SetSlowDown( 1.000000 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 492.185028 , 201.689499 , 157.439575 )
   Camera:MotionSpline_AddSplinePoint( 438.607391 , 172.932220 , 150.879196 )
   Camera:MotionSpline_AddSplinePoint( 401.899353 , 151.128998 , 106.702843 )
   Camera:MotionSpline_AddSplinePoint( 388.700409 , 134.804108 , 48.986496 )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 6.000000 )
