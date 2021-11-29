-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 429.542847 , 548.730469 , 15.015221 , 19.500038 , [[Camera:ScriptSplineLookAtNpc(5462);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 429.542847 , 548.730469 , 15.015221 , 12.900013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.542847 , 548.730469 , 15.015221 , 19.400038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.542847 , 548.730469 , 15.015221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
