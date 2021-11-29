-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 382.199982 , 32.318169 , 129.982849 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(382.200,55.105,95.305);]] )
   Camera:MotionSpline_AddSplinePoint( 382.199982 , 32.318161 , 129.982849 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.199982 , 32.318161 , 129.982849 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.199982 , 32.318161 , 129.982849 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
