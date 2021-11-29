-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 376.857147 , 67.504776 , 99.500000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(386.164,55.462,82.700);]] )
   Camera:MotionSpline_AddSplinePoint( 376.857147 , 67.504776 , 99.500000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.857147 , 67.504776 , 99.500000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.857147 , 67.504776 , 99.500000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
