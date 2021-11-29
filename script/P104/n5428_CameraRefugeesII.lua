-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 455.137207 , 113.998497 , 57.744999 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(439.243,167.494,25.000);]] )
   Camera:MotionSpline_AddSplinePoint( 465.082397 , 118.524391 , 58.144947 , 8.999998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 478.849640 , 129.834976 , 58.464977 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 488.600739 , 145.497284 , 58.874973 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
