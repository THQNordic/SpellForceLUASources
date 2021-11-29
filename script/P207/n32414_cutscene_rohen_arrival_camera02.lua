-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 383.700531 , 70.995117 , 94.203896 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(384.300,57.820,90.500);]] )
   Camera:MotionSpline_AddSplinePoint( 371.843140 , 62.555344 , 94.203880 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 372.064545 , 52.560246 , 94.203880 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.921936 , 50.000000 , 95.203880 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
