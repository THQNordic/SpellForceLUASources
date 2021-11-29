-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 333.250336 , 408.557434 , 50.174740 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(353.328,426.784,43.810);]] )
   Camera:MotionSpline_AddSplinePoint( 334.496552 , 405.566650 , 49.582588 , 16.600027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 338.516113 , 401.201843 , 48.000687 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 345.162079 , 397.648041 , 47.574753 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
