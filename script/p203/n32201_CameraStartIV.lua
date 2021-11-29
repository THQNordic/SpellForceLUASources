-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 179.281479 , 534.533142 , 9.126693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(169.458,542.265,5.380);]] )
   Camera:MotionSpline_AddSplinePoint( 179.281479 , 534.533142 , 9.126693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 179.281479 , 534.533142 , 9.126693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 179.281479 , 534.533142 , 9.126693 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
