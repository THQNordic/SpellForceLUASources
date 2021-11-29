-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 298.286987 , 182.843430 , 37.866692 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(298.200,201.385,40.000);]] )
   Camera:MotionSpline_AddSplinePoint( 298.286987 , 188.854141 , 38.783325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 298.286987 , 192.509796 , 39.783325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 298.286987 , 194.591858 , 40.866692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
