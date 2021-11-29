-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 15.711971 , 41.053177 , 30.271660 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(51.877,77.701,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 45.810482 , 29.751816 , 29.621635 , 14.100018 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 89.187477 , 41.286015 , 30.181660 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 88.756172 , 72.088028 , 29.541565 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
