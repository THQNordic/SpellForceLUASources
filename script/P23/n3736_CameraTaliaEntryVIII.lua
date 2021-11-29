-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 144.001816 , 354.067932 , 24.109684 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(3912);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2.2);]] )
   Camera:MotionSpline_AddSplinePoint( 148.635513 , 347.876862 , 23.784588 , 16.500027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 150.240646 , 347.017853 , 24.054111 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 151.999603 , 346.363190 , 24.334093 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
