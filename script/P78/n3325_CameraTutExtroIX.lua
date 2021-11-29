-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 239.785110 , 262.363861 , 18.785660 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(247.353,269.449,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 239.785110 , 262.363861 , 18.785660 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 239.785110 , 262.363861 , 18.785660 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 239.785110 , 262.363861 , 18.785660 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
