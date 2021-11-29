-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 88.530586 , 98.503708 , 31.826944 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(53.047,79.100,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 85.079697 , 103.036209 , 31.876852 , 19.200037 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 79.867043 , 106.613136 , 31.116911 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 73.916946 , 109.711395 , 31.327246 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
