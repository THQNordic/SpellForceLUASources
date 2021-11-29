-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 272.387665 , 187.715988 , 32.716690 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(270.000,176.671,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 272.387665 , 187.715988 , 32.716690 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(270.000,176.671,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 272.387665 , 187.715988 , 32.716690 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(270.000,176.671,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 272.387665 , 187.715988 , 32.716690 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(270.000,176.671,30.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
