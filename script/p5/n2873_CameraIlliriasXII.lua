-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 626.173950 , 396.401978 , 45.261677 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(610.658,402.037,40.560);]] )
   Camera:MotionSpline_AddSplinePoint( 636.234558 , 393.384399 , 46.051659 , 7.099996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 643.414368 , 391.231354 , 46.611675 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 649.504395 , 389.405731 , 46.671478 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 662.210266 , 385.597015 , 45.711941 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
