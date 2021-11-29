-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 185.801743 , 500.703644 , 32.484142 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(150.063,500.704,28.000);]] )
   Camera:MotionSpline_AddSplinePoint( 190.801743 , 500.703644 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 195.801743 , 500.703644 , 32.484142 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.015);
   Camera:ScriptSplineLookAtPosition(180.063,500.704,28.000);]] )
   Camera:MotionSpline_AddSplinePoint( 195.801743 , 507.703644 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 190.801743 , 514.703644 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 185.801743 , 517.703674 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 182.801743 , 520.703674 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 180.801743 , 523.703674 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 180.801743 , 525.703674 , 32.484142 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 16.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
