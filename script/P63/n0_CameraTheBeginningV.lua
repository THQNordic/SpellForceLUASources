-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 94.343552 , 365.094025 , 30.541538 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2);]] )
   Camera:MotionSpline_AddSplinePoint( 96.750793 , 365.108276 , 30.581535 , 6.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 98.220726 , 365.107422 , 30.581535 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 100.156601 , 366.011902 , 30.591534 , 0.000000 , [[Camera:ScriptSplineAddTargetLookAtOffset(0,0,0);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
