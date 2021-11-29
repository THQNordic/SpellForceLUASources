-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 610.950867 , 395.631409 , 28.015221 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6806);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 610.950867 , 395.631409 , 28.015221 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 610.950867 , 395.631409 , 28.015221 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 610.950867 , 395.631409 , 28.015221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
