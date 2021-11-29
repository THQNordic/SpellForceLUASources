-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 312.118286 , 273.281311 , 47.116402 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(289.236,289.591,19.800);]] )
   Camera:MotionSpline_AddSplinePoint( 306.800720 , 266.776733 , 47.086349 , 13.200014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 301.469513 , 260.255432 , 47.176197 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 296.131042 , 253.725281 , 47.416348 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
