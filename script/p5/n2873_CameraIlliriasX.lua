-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 598.859680 , 451.393005 , 45.031487 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(594.142,446.619,44.000);]] )
   Camera:MotionSpline_AddSplinePoint( 595.586365 , 453.136322 , 45.031487 , 11.900009 , [[Camera:ScriptSplineLookAtPosition(595.360,443.061,48.000);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 590.128296 , 451.618713 , 45.031487 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 587.520996 , 449.512299 , 45.031487 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
