-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 207.586731 , 525.397095 , 40.086403 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(242.383,555.712,37.000);]] )
   Camera:MotionSpline_AddSplinePoint( 235.586731 , 518.407349 , 33.413223 , 8.799997 , [[Camera:ScriptSplineLookAtSpline();
Camera:ScriptSplineLookAtApproachingModifier(0.075);]] )
   Camera:MotionSpline_AddSplinePoint( 261.249939 , 507.466400 , 32.686409 , 12.700012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 284.507935 , 497.978882 , 30.896400 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 328.766998 , 487.909637 , 38.546272 , 19.800039 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.664063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
