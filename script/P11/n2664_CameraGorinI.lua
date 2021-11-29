-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 327.746704 , 121.885376 , 53.866692 , 15.900024 , [[Camera:ScriptSplineLookAtPosition(440.449,224.226,60.770);]] )
   Camera:MotionSpline_AddSplinePoint( 338.106049 , 167.696716 , 47.866692 , 7.799995 , [[Camera:ScriptSplineLookAtPosition(440.449,224.226,60.770);]] )
   Camera:MotionSpline_AddSplinePoint( 345.610229 , 212.547943 , 50.866692 , 15.800024 , [[Camera:ScriptSplineLookAtPosition(440.449,224.226,60.770);]] )
   Camera:MotionSpline_AddSplinePoint( 409.868317 , 284.257141 , 47.866692 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(440.449,224.226,60.770);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 16.000000 )
   Camera:MotionSpline_SetCorrection( 1.210938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
