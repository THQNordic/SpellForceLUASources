-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 31.857807 , 250.476425 , 18.719692 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(57.174,270.753,18.680);]] )
   Camera:MotionSpline_AddSplinePoint( 31.857807 , 250.476425 , 19.719692 , 6.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 31.857807 , 250.476425 , 20.719692 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 31.857807 , 250.476425 , 21.719692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
