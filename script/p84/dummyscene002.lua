-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 161.036636 , 108.951180 , 34.245876 , 24.900059 , [[Camera:ScriptSplineLookAtPosition(162.424,128.819,13);]] )
   Camera:MotionSpline_AddSplinePoint( 161.036636 , 114.625809 , 33.804409 , 11.600008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 160.971863 , 118.211235 , 31.705875 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.036636 , 126.116463 , 23.663130 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
