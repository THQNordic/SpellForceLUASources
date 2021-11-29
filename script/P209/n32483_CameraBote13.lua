-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 387.559967 , 338.234253 , 22.326838 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(406.964,367.220,15.140);]] )
   Camera:MotionSpline_AddSplinePoint( 387.559967 , 338.234253 , 22.326838 , 6.399996 , [[Camera:ScriptSplineLookAtPosition(406.964,367.220,15.140);]] )
   Camera:MotionSpline_AddSplinePoint( 387.559967 , 338.234253 , 22.326838 , 9.600000 , [[Camera:ScriptSplineLookAtPosition(406.964,367.220,15.140);]] )
   Camera:MotionSpline_AddSplinePoint( 387.559967 , 338.234253 , 22.326838 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(406.964,367.220,15.140);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
