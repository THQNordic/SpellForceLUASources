-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 302.302063 , 441.788574 , 13.502625 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(299.500,444.100,12.800);]] )
   Camera:MotionSpline_AddSplinePoint( 302.302063 , 441.788574 , 13.502625 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(299.500,444.100,12.800);]] )
   Camera:MotionSpline_AddSplinePoint( 302.302063 , 441.788574 , 13.502625 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(299.500,444.100,12.800);]] )
   Camera:MotionSpline_AddSplinePoint( 302.302063 , 441.788574 , 13.502625 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(299.500,444.100,12.800);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
