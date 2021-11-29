-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 1 )
    Camera:MotionSpline_SetSlowDown( 0)
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePointAtCamera()
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
