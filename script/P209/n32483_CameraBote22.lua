-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 300.111053 , 440.757172 , 18.725849 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(301.884,446.710,8.000);]] )
   Camera:MotionSpline_AddSplinePoint( 300.111053 , 440.757172 , 18.725849 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(301.884,446.710,8.000);]] )
   Camera:MotionSpline_AddSplinePoint( 300.111053 , 440.757172 , 18.725849 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(301.884,446.710,8.000);]] )
   Camera:MotionSpline_AddSplinePoint( 300.111053 , 440.757172 , 18.725849 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(301.884,446.710,8.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
