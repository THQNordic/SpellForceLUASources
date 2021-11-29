-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 54.037811 , 77.481842 , 29.263380 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(52.192,73.893,31.415);]] )
   Camera:MotionSpline_AddSplinePoint( 53.324821 , 78.183014 , 29.263380 , 6.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 52.611832 , 78.884186 , 29.263380 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 51.898842 , 79.585358 , 29.263380 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
