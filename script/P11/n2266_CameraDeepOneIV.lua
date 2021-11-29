-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 445.815033 , 570.322083 , 61.366402 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(400.392,573.228,30.057);]] )
   Camera:MotionSpline_AddSplinePoint( 440.753632 , 575.098877 , 51.013229 , 8.699997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 431.547607 , 577.493652 , 41.426682 , 12.700012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 422.801392 , 579.511292 , 34.026691 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 416.863098 , 577.853210 , 33.396400 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
