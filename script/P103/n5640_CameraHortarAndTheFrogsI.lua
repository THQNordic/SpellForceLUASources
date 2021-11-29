-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 424.602844 , 539.429504 , 56.272751 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(474.410,572.883,24.950);]] )
   Camera:MotionSpline_AddSplinePoint( 430.409454 , 532.754456 , 55.685738 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 436.261383 , 526.027344 , 54.632530 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 447.883575 , 512.666870 , 53.201752 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
