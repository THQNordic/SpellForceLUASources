-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 159.315903 , 128.818909 , 10.825220 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(162.522,128.800,11);]] )
   Camera:MotionSpline_AddSplinePoint( 159.315903 , 128.818909 , 12.825220 , 3.399999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 160.315094 , 128.818909 , 14.825220 , 6.699996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.314285 , 128.818909 , 18.825220 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 162.313477 , 128.818909 , 28.825220 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
