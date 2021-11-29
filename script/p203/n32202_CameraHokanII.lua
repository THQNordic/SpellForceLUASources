-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 652.221069 , 575.411987 , 9.636693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(651.048,563.143,10.050);]] )
   Camera:MotionSpline_AddSplinePoint( 652.221069 , 575.411987 , 9.636693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 652.221069 , 575.411987 , 9.636693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 652.221069 , 575.411987 , 9.636693 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
