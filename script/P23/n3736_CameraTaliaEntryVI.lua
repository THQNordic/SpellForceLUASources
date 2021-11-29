-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 122.684341 , 338.334259 , 32.203880 , 29.400076 , [[Camera:ScriptSplineLookAtPosition(148.943,348.710,25.050);]] )
   Camera:MotionSpline_AddSplinePoint( 123.406418 , 337.127716 , 32.143883 , 20.700043 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 123.911552 , 336.334625 , 32.003895 , 29.300076 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 124.398041 , 335.534058 , 32.003883 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
