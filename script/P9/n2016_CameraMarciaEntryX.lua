-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 525.572083 , 454.119049 , 30.533230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(532.298,456.730,23.000);]] )
   Camera:MotionSpline_AddSplinePoint( 526.721680 , 452.539948 , 30.533230 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 528.153015 , 451.220184 , 30.533230 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 529.825989 , 450.197540 , 30.533230 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
