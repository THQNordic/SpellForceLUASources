-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 1 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 462.123077 , 192.167130 , 110.256493 , 19.000036 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 474.093933 , 166.792923 , 110.329689 , 5.699997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 494.898376 , 151.490952 , 124.866409 , 9.400000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 523.410461 , 150.113464 , 148.342758 , 13.800016 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 534.460876 , 190.982697 , 150.689835 , 18.900036 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 498.984100 , 220.469223 , 129.793213 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 19.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
