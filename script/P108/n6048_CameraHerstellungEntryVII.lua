-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 664.692993 , 346.070526 , 46.971813 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(670.413,367.876,25.001);]] )
   Camera:MotionSpline_AddSplinePoint( 669.046814 , 342.627686 , 47.031830 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 674.656189 , 342.075836 , 47.111794 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 680.186096 , 344.546295 , 47.161812 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
