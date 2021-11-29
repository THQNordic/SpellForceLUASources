-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 215.801743 , 480.703644 , 32.484142 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(180.063,480.704,22.000);]] )
   Camera:MotionSpline_AddSplinePoint( 211.801743 , 480.703644 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 207.801743 , 480.703644 , 32.484142 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 205.801743 , 480.703644 , 32.484142 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
