-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 36.708393 , 485.182129 , 90.249580 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(78.721,501.103,44.470);]] )
   Camera:MotionSpline_AddSplinePoint( 38.893841 , 471.332703 , 91.149490 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 45.447102 , 459.917542 , 90.259636 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 56.321186 , 451.018524 , 88.639610 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
