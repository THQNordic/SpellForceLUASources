-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 279.218536 , 215.762070 , 14.165415 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(253.625,213.974,15.680);]] )
   Camera:MotionSpline_AddSplinePoint( 269.206360 , 214.839890 , 14.886194 , 18.800035 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 261.902374 , 214.289246 , 14.933668 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 251.868423 , 213.835144 , 15.655220 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
