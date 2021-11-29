-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 378.326447 , 58.737247 , 90.500000 , 14.100018 , [[Camera:ScriptSplineLookAtPosition(382.195,57.198,89.400);]] )
   Camera:MotionSpline_AddSplinePoint( 379.307281 , 59.743576 , 90.500000 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.300873 , 59.749943 , 90.500000 , 14.000017 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.294403 , 59.769081 , 90.500000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
