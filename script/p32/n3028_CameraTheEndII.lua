-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 517.301453 , 501.082397 , 69.369217 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(536.780,510.130,67.000);]] )
   Camera:MotionSpline_AddSplinePoint( 515.858765 , 503.320526 , 69.199219 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 514.302002 , 506.304626 , 69.068909 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 513.380859 , 509.595367 , 68.989220 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
