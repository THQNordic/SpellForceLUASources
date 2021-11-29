-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 222.604691 , 300.138855 , 32.516525 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(224.675,303.572,31.000);]] )
   Camera:MotionSpline_AddSplinePoint( 223.826630 , 296.504242 , 35.516525 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(224.675,303.572,31.000);]] )
   Camera:MotionSpline_AddSplinePoint( 225.285477 , 293.604889 , 37.516525 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(224.675,303.572,31.000);]] )
   Camera:MotionSpline_AddSplinePoint( 228.223602 , 292.918915 , 38.516525 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(224.675,303.572,31.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
