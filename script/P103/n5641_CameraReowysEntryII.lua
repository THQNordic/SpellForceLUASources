-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 567.749390 , 458.052765 , 52.909546 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(549.680,474.983,48.110);]] )
   Camera:MotionSpline_AddSplinePoint( 569.074463 , 460.521637 , 52.859547 , 7.399995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 570.330933 , 462.862701 , 53.210548 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 572.984436 , 467.806671 , 54.049545 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
