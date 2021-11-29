-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 218.259186 , 204.003662 , 35.000000 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(11418);]] )
   Camera:MotionSpline_AddSplinePoint( 200.992462 , 218.946045 , 35.000000 , 13.500015 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 176.195465 , 229.412186 , 35.000000 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 154.766434 , 220.579224 , 35.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
