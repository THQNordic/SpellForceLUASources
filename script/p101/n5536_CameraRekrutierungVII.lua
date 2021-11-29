-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 406.063354 , 147.905807 , 17.181009 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(416.036,166.788,10.994);]] )
   Camera:MotionSpline_AddSplinePoint( 407.916992 , 147.176331 , 17.041008 , 4.799998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 409.718506 , 146.467361 , 16.991009 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 413.500183 , 144.979111 , 17.421013 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
