-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 498.009552 , 412.630310 , 68.836403 , 24.900059 , [[Camera:ScriptSplineLookAtPosition(500.261,443.181,33.000);]] )
   Camera:MotionSpline_AddSplinePoint( 498.569794 , 384.697998 , 68.076401 , 6.799996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 477.781860 , 363.424164 , 67.696404 , 13.200014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 435.115723 , 386.503113 , 42.686508 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 391.388306 , 477.728241 , 33.576401 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.898438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
