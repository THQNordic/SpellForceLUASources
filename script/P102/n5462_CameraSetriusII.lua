-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 426.660126 , 548.562317 , 15.015221 , 19.600039 , [[Camera:ScriptSplineLookAtNpc(5461);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.2);]] )
   Camera:MotionSpline_AddSplinePoint( 426.660126 , 548.562317 , 15.015221 , 13.000013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 426.660126 , 548.562317 , 15.015221 , 19.500038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 426.660126 , 548.562317 , 15.015221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
