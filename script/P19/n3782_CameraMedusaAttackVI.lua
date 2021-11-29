-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 361.729584 , 317.169647 , 55.231197 , 9.800001 , [[Camera:ScriptSplineLookAtNpc(4364);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 361.729584 , 317.169647 , 54.231197 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 361.729584 , 317.169647 , 53.231197 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 361.729584 , 317.169647 , 52.231197 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
