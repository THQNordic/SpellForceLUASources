-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 212.527283 , 154.052734 , 25.786692 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(215.220,156.907,22.883);]] )
   Camera:MotionSpline_AddSplinePoint( 211.919891 , 150.740891 , 28.445095 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(215.220,156.907,22.883);]] )
   Camera:MotionSpline_AddSplinePoint( 211.527283 , 148.612503 , 31.997955 , 14.800020 , [[Camera:ScriptSplineLookAtPosition(215.220,156.907,22.883);]] )
   Camera:MotionSpline_AddSplinePoint( 210.977905 , 146.120621 , 36.339664 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(215.220,156.907,22.883);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
