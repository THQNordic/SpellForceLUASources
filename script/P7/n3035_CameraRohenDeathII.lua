-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 51.105930 , 46.529121 , 44.231075 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(63.208,52.678,41.620);]] )
   Camera:MotionSpline_AddSplinePoint( 50.365925 , 48.252808 , 44.251076 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 49.625870 , 49.976608 , 44.221077 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 49.265377 , 50.775326 , 44.051075 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
