-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 71.352127 , 39.448719 , 41.000000 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(4185);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 71.355484 , 41.315121 , 41.000000 , 6.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 71.355484 , 42.229259 , 41.000000 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 71.355484 , 44.859779 , 41.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
