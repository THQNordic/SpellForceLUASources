-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 298.884430 , 447.400055 , 13.866692 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(296.001,446.950,13.300);]] )
   Camera:MotionSpline_AddSplinePoint( 298.884430 , 447.400055 , 13.866692 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(296.001,446.950,13.300);]] )
   Camera:MotionSpline_AddSplinePoint( 298.884430 , 447.400055 , 13.866692 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(296.001,446.950,13.300);]] )
   Camera:MotionSpline_AddSplinePoint( 298.884430 , 447.400055 , 13.866692 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(296.001,446.950,13.300);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
