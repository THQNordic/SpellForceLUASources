-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 47.000000 , 100.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(382.000,57.820,93.500);]] )
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 47.000000 , 100.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 47.000000 , 100.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 47.000000 , 100.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
