-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 501.944458 , 505.100250 , 43.198517 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(411.501,470.588,39.993);]] )
   Camera:MotionSpline_AddSplinePoint( 454.205292 , 499.329346 , 47.432858 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 415.270752 , 489.568237 , 46.100082 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 384.238800 , 491.725739 , 45.163292 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
