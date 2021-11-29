-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 533.793701 , 413.558167 , 67.945412 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(539.081,417.185,65.200);]] )
   Camera:MotionSpline_AddSplinePoint( 533.793701 , 413.558167 , 67.945412 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 533.793701 , 413.558167 , 67.945412 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 533.793701 , 413.558167 , 67.945412 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
