-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 90.530609 , 357.249329 , 31.206398 , 30.900082 , [[Camera:ScriptSplineLookAtPosition(96.815,369.852,30.000);
Camera:ScriptSplineLookAtApproachingModifier(0.005);]] )
   Camera:MotionSpline_AddSplinePoint( 94.530609 , 356.249329 , 32.206398 , 19.600039 , [[Camera:ScriptSplineLookAtPosition(96.815,369.385,31.500);]] )
   Camera:MotionSpline_AddSplinePoint( 97.963097 , 357.249329 , 31.006401 , 30.800081 , [[Camera:ScriptSplineLookAtPosition(96.815,369.385,31.500);]] )
   Camera:MotionSpline_AddSplinePoint( 101.972412 , 359.249329 , 30.006401 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(96.815,369.385,30.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 31.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )