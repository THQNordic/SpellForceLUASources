-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 402.994080 , 312.740295 , 69.610352 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(444.006,347.134,27.760);]] )
   Camera:MotionSpline_AddSplinePoint( 418.802887 , 307.478333 , 69.200294 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 439.836670 , 307.383881 , 69.119942 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 466.085602 , 302.020752 , 68.790123 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 50.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
