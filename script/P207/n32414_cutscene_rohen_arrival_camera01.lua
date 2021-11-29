-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 80.018204 , 100.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(381.922,50.337,90.000);]] )
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 75.364014 , 100.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 70.018204 , 100.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.000000 , 65.824638 , 100.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 45.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
