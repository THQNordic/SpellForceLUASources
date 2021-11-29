-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 413.903137 , 305.270172 , 25.582350 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(438.672,330.660,24.000);]] )
   Camera:MotionSpline_AddSplinePoint( 413.217957 , 304.541809 , 25.582350 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 413.217957 , 304.541809 , 25.582350 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 413.217957 , 304.541809 , 25.582350 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
