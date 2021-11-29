-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 633.600037 , 73.317459 , 30.104057 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(5428);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,3);]] )
   Camera:MotionSpline_AddSplinePoint( 633.600037 , 73.317459 , 28.104057 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 633.600037 , 73.317459 , 26.104057 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 633.600037 , 73.317459 , 24.104057 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
