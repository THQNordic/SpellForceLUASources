-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 110.649361 , 155.534882 , 15.194935 , 44.099899 , [[Camera:ScriptSplineLookAtPosition(104.790,193.515,15);]] )
   Camera:MotionSpline_AddSplinePoint( 109.118385 , 169.845901 , 12.814953 , 5.999997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 120.736488 , 180.583221 , 13.568823 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(151.581,167.898,10);]] )
   Camera:MotionSpline_AddSplinePoint( 139.743225 , 178.248474 , 12.787105 , 13.500015 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 158.982162 , 180.518448 , 13.786709 , 16.300026 , [[Camera:ScriptSplineLookAtPosition(150.031,197.117,10);]] )
   Camera:MotionSpline_AddSplinePoint( 168.729370 , 189.851318 , 14.789120 , 19.600039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 165.724823 , 205.966492 , 13.789099 , 23.700054 , [[Camera:ScriptSplineLookAtPosition(183.584,201.728,10);]] )
   Camera:MotionSpline_AddSplinePoint( 145.939865 , 213.028366 , 16.317234 , 30.300079 , [[Camera:ScriptSplineLookAtPosition(157.654,229.801,10);]] )
   Camera:MotionSpline_AddSplinePoint( 112.079216 , 213.155075 , 13.067576 , 34.100052 , [[Camera:ScriptSplineLookAtPosition(90.661,224.465,10);]] )
   Camera:MotionSpline_AddSplinePoint( 94.124367 , 207.029022 , 14.067505 , 37.799995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 90.420029 , 189.312363 , 16.247219 , 41.099945 , [[Camera:ScriptSplineLookAtPosition(87.491,169.770,10);]] )
   Camera:MotionSpline_AddSplinePoint( 104.520790 , 182.248917 , 18.943668 , 43.999901 , [[Camera:ScriptSplineLookAtPosition(104.790,193.515,15);]] )
   Camera:MotionSpline_AddSplinePoint( 113.768456 , 192.709076 , 23.183647 , 44.099899 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 44.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
