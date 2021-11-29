-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 497.670807 , 608.293335 , 40.850845 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(474.783,576.668,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 491.360291 , 610.803345 , 41.060833 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 484.694244 , 612.027039 , 41.420845 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 471.277832 , 610.492615 , 42.040634 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
