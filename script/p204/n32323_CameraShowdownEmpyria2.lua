-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 455.157928 , 231.390854 , 24.679401 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(8794);]] )
   Camera:MotionSpline_AddSplinePoint( 455.222870 , 237.970352 , 25.679401 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 456.242889 , 241.171616 , 26.679401 , 14.800020 , [[Camera:ScriptSplineLookAtNpc(8794);]] )
   Camera:MotionSpline_AddSplinePoint( 458.159698 , 254.331436 , 29.679401 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 457.223358 , 256.769714 , 29.995586 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 457.497162 , 257.083527 , 34.835609 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
