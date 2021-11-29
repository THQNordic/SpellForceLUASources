-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 159.596710 , 133.001022 , 12.393494 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(163,129.941,10);]] )
   Camera:MotionSpline_AddSplinePoint( 159.596710 , 133.001022 , 12.393494 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.596710 , 133.001022 , 12.393494 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.596710 , 133.001022 , 12.393494 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
