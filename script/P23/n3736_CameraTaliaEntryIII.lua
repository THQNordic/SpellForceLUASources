-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 87.004486 , 329.284882 , 31.424862 , 24.800058 , [[Camera:ScriptSplineLookAtPosition(179.611,360.469,40.757);]] )
   Camera:MotionSpline_AddSplinePoint( 87.058441 , 327.409668 , 33.324863 , 14.100018 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 87.112396 , 325.534454 , 35.314861 , 24.700058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 87.137589 , 324.658813 , 40.284863 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
