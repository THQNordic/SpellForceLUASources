-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 612.927063 , 397.512299 , 32.698341 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6806);
]] )
   Camera:MotionSpline_AddSplinePoint( 612.565918 , 397.320862 , 37.370586 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 612.206299 , 397.130249 , 42.022900 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 611.844299 , 396.938385 , 46.705044 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
