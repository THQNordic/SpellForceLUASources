-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 176.879974 , 456.589966 , 49.716400 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(178.361,481.282,22.000);
]] )
   Camera:MotionSpline_AddSplinePoint( 178.879974 , 456.589966 , 49.716400 , 6.499996 , [[Camera:ScriptSplineLookAtApproachingModifier(0.005);
Camera:ScriptSplineLookAtPosition(194.361,481.282,22.000);
]] )
   Camera:MotionSpline_AddSplinePoint( 180.879974 , 456.589966 , 49.716400 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 184.879974 , 456.589966 , 49.716400 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 186.879974 , 456.589966 , 49.716400 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 188.879974 , 456.589966 , 49.716400 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 190.879974 , 456.589966 , 49.716400 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
