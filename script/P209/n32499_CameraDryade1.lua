-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 589.452454 , 342.607819 , 22.546402 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(577.962,353.079,9.000);]] )
   Camera:MotionSpline_AddSplinePoint( 589.452454 , 342.607819 , 22.546402 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(577.962,353.079,9.000);]] )
   Camera:MotionSpline_AddSplinePoint( 589.452454 , 342.607819 , 22.546402 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(577.962,353.079,9.000);]] )
   Camera:MotionSpline_AddSplinePoint( 589.452454 , 342.607819 , 22.546402 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(577.962,353.079,9.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
