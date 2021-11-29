-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 672.442749 , 580.124451 , 12.646692 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(672.410,545.721,12.600);]] )
   Camera:MotionSpline_AddSplinePoint( 672.442749 , 580.124451 , 12.646692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 672.442749 , 580.124451 , 12.646692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 672.442749 , 580.124451 , 12.646692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
