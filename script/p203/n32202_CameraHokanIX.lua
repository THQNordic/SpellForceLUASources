-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 650.455200 , 575.974487 , 9.216693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(649.580,557.812,8.140);]] )
   Camera:MotionSpline_AddSplinePoint( 650.455200 , 575.974487 , 9.216693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 650.455200 , 575.974487 , 9.216693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 650.455200 , 575.974487 , 9.216693 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
