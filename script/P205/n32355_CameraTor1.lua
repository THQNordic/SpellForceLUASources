-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 467.204559 , 384.741974 , 21.585588 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11757);]] )
   Camera:MotionSpline_AddSplinePoint( 467.204559 , 384.741974 , 21.585588 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 467.204559 , 384.741974 , 21.585588 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 467.204559 , 384.741974 , 21.585588 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
