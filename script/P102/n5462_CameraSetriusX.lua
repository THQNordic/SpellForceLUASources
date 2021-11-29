-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 436.932922 , 541.443115 , 16.118353 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(6311);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 436.971436 , 535.039551 , 16.118353 , 7.099996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 436.979919 , 533.633728 , 16.118353 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 436.997650 , 530.682068 , 16.168352 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
