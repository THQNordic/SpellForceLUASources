-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 261.108582 , 584.022766 , 26.646690 , 16.900028 , [[Camera:ScriptSplineLookAtPosition(308.376,567.759,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 258.817505 , 585.931458 , 33.633091 , 12.000010 , [[Camera:ScriptSplineLookAtPosition(308.376,567.759,23.000);]] )
   Camera:MotionSpline_AddSplinePoint( 258.236755 , 586.852600 , 42.080688 , 16.800028 , [[Camera:ScriptSplineLookAtPosition(308.376,567.759,23.000);]] )
   Camera:MotionSpline_AddSplinePoint( 259.243073 , 587.227478 , 48.399403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(308.376,567.759,23.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 17.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
