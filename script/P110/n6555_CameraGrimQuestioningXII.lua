-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 617.362549 , 391.231812 , 34.924110 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6046);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 617.352417 , 392.231750 , 33.924110 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 617.342285 , 393.231689 , 32.924110 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 617.311890 , 396.231506 , 28.924110 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
