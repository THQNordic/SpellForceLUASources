-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 361.250153 , 186.744949 , 30.916016 , 14.200018 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 361.250153 , 186.744949 , 30.916016 , 9.400000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 361.250153 , 186.744949 , 30.916016 , 14.100018 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 361.250153 , 186.744949 , 30.916016 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
