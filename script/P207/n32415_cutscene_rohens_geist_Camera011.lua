-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 382.351898 , 60.750099 , 92.000000 , 14.100018 , [[Camera:ScriptSplineLookAtPosition(382.350,58.500,89.700);]] )
   Camera:MotionSpline_AddSplinePoint( 382.351898 , 60.750099 , 92.000000 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.351898 , 60.750099 , 92.000000 , 14.000017 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.351898 , 60.750099 , 92.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
