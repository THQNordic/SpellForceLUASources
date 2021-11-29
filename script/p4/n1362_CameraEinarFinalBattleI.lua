-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 378.014130 , 512.615723 , 54.787094 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(353.703,517.878,42.590);]] )
   Camera:MotionSpline_AddSplinePoint( 381.960022 , 494.570801 , 53.447098 , 12.200010 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 370.852325 , 467.558594 , 52.797096 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 380.774261 , 439.481476 , 52.727097 , 18.000032 , [[Camera:ScriptSplineLookAtPosition(582.940,369.428,35.300);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
