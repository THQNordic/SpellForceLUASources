-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 147.007172 , 128.552811 , 18.533230 , 9.199999 , [[Camera:ScriptSplineLookAtPosition(147.007,160.312,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 147.007172 , 128.552811 , 18.533230 , 6.099997 , [[Camera:ScriptSplineLookAtPosition(147.007,160.312,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 147.007172 , 128.552811 , 18.533230 , 9.099998 , [[Camera:ScriptSplineLookAtPosition(147.007,160.312,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 147.007172 , 128.552811 , 18.533230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(147.007,160.312,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
