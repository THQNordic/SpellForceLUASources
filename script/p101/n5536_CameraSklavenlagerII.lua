-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 301.702148 , 112.119019 , 25.892113 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(303.352,134.404,23.500);]] )
   Camera:MotionSpline_AddSplinePoint( 316.246796 , 109.436340 , 30.842113 , 11.200006 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 324.144867 , 116.344505 , 32.132122 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 322.054779 , 131.128754 , 29.016357 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
