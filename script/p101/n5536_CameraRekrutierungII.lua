-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 420.416992 , 178.426971 , 13.468648 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(410.385,161.896,10.917);]] )
   Camera:MotionSpline_AddSplinePoint( 419.037292 , 179.806625 , 13.518647 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 416.260071 , 180.976639 , 13.088649 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 413.465424 , 181.395676 , 12.928645 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
