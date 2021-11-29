-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 151.985992 , 133.608337 , 35.000000 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
   Camera:MotionSpline_AddSplinePoint( 172.952362 , 125.065063 , 35.000000 , 14.400019 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
   Camera:MotionSpline_AddSplinePoint( 193.751968 , 122.155235 , 35.000000 , 19.800039 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
   Camera:MotionSpline_AddSplinePoint( 208.623779 , 128.749222 , 35.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11419);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
