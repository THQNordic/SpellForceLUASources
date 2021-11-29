-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 374.210968 , 516.465088 , 32.758415 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(2016);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 375.440887 , 520.359924 , 32.758415 , 12.000010 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.713135 , 524.291504 , 32.788414 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.697266 , 529.588379 , 33.098427 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
