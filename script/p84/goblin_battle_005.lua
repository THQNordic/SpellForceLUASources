-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 153.950607 , 129.081161 , 21.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(162.314,128.653,9);]] )
   Camera:MotionSpline_AddSplinePoint( 156.878372 , 134.169205 , 21.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.714005 , 136.342697 , 21.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 167.877594 , 134.406067 , 21.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(162.314,128.653,12););
Camera:ScriptSplineLookAtApproachingModifier(0.02);]] )
   Camera:MotionSpline_AddSplinePoint( 170.975540 , 128.579300 , 19.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 169.109879 , 122.481979 , 17.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 162.178421 , 119.350388 , 15.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 156.114822 , 122.183426 , 13.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 151.950607 , 129.081161 , 13.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
