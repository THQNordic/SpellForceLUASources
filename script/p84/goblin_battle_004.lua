-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
-- Camera:MotionSpline_AddSplinePoint( 153.950607 , 129.081161 , 21.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(162.314,128.653,8);]] )
   Camera:MotionSpline_AddSplinePoint( 155.352463 , 119.372398 , 14.512413 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(162.314,128.653,8);]] )
   Camera:MotionSpline_AddSplinePoint( 156.878372 , 134.169205 , 21.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 161.714005 , 136.342697 , 21.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 166.877594 , 134.406067 , 21.000000 , 0.000000 , [[]] )
--Camera:MotionSpline_AddSplinePoint( 168.975540 , 128.579300 , 19.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(162.314,128.653,11);
--Camera:ScriptSplineLookAtApproachingModifier(0.02);]] )
   Camera:MotionSpline_AddSplinePoint( 168.975540 , 128.579300 , 19.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(162.314,128.653,11););
Camera:ScriptSplineLookAtApproachingModifier(0.02);]] )
   Camera:MotionSpline_AddSplinePoint( 166.109879 , 124.481979 , 17.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 162.178421 , 122.350388 , 15.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 157.114822 , 124.183426 , 13.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 153.950607 , 129.081161 , 13.000000 , 0.000000 , [[]] )   
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
