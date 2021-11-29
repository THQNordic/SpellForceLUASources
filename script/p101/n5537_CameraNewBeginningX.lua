-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 54.222240 , 79.927078 , 25.895220 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5536);
Camera:ScriptSplineAddTargetLookAtOffset(0,-5,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 54.222240 , 77.927078 , 25.895220 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 54.222240 , 75.927078 , 25.895220 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 53.222240 , 74.927078 , 25.895220 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
