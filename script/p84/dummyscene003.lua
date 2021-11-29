-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 161.909958 , 121.192657 , 19.677076 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(161.163,129.928,13);]] )
   Camera:MotionSpline_AddSplinePoint( 157.978378 , 124.012306 , 19.247032 , 6.599996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.456604 , 129.746078 , 19.737030 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.393036 , 133.692154 , 21.127031 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
