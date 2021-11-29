-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 62.686905 , 47.664967 , 42.550911 , 19.700039 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 63.573586 , 46.824394 , 41.980915 , 13.300014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 64.478783 , 45.820908 , 42.175247 , 19.600039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 65.290024 , 44.828083 , 42.044308 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
