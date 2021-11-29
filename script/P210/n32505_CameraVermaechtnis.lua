-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 371.408386 , 470.642609 , 36.637081 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(370.532,588.557,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 370.831543 , 506.628174 , 27.637081 , 16.000025 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 370.701447 , 528.628174 , 21.637081 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 370.530975 , 565.628174 , 16.637081 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
