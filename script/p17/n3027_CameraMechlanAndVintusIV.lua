-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 433.370972 , 564.974548 , 212.835739 , 14.600019 , [[Camera:ScriptSplineLookAtNpc(2620);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 433.323578 , 564.506958 , 212.835739 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 433.276398 , 564.041321 , 212.835739 , 14.500019 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 433.229309 , 563.576843 , 212.835739 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
