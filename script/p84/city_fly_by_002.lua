-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 135.390472 , 174.248138 , 18.057743 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(151.187,169.283,12);]] )
   Camera:MotionSpline_AddSplinePoint( 143.160629 , 174.728470 , 12.568228 , 6.799996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 150.766861 , 177.693451 , 12.638222 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 156.419373 , 181.625839 , 16.618399 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
