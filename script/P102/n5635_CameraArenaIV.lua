-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 244.889664 , 518.441711 , 9.162670 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(254.250,526.031,10.080);]] )
   Camera:MotionSpline_AddSplinePoint( 246.318329 , 517.148376 , 9.552653 , 8.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 248.362213 , 515.012329 , 9.712458 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 251.425140 , 512.784302 , 9.822560 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
