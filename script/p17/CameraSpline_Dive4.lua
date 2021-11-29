-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 462.238220 , 241.740402 , 110.336693 , 16.000025 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 389.150818 , 215.526184 , 95.186768 , 7.899995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 324.834534 , 191.495956 , 82.556694 , 9.500000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 308.156677 , 169.743820 , 73.276688 , 10.800005 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 319.048920 , 152.491455 , 61.026688 , 12.700012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 347.823944 , 144.648849 , 43.246689 , 15.900024 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 404.341431 , 133.176880 , 26.986496 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 16.000000 )
   Camera:MotionSpline_SetCorrection( 1.914063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
