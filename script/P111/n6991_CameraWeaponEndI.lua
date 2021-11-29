-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 413.613159 , 61.698509 , 19.217310 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(404.693,68.100,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 414.632233 , 61.709633 , 19.197311 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 416.623535 , 62.344574 , 19.287312 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 418.881744 , 65.150421 , 19.157310 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
