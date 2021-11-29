-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 399.537872 , 369.064362 , 10.574423 , 5.000000 , [[Camera:ScriptSplineLookAtPosition(407.000,367.679,11.000);]] )
   Camera:MotionSpline_AddSplinePoint( 399.537872 , 369.064362 , 10.574423 , 5.000000 , [[Camera:ScriptSplineLookAtPosition(407.000,367.679,11.000);]] )
   Camera:MotionSpline_AddSplinePoint( 399.537872 , 369.064362 , 10.574423 , 5.000000 , [[Camera:ScriptSplineLookAtPosition(407.000,367.679,11.000);]] )
   Camera:MotionSpline_AddSplinePoint( 399.537872 , 369.064362 , 10.574423 , 5.000000 , [[Camera:ScriptSplineLookAtPosition(407.000,367.679,11.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
