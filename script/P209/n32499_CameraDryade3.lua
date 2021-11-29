-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 644.862610 , 485.119263 , 6.224586 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(637.320,488.898,5.000);]] )
   Camera:MotionSpline_AddSplinePoint( 643.520447 , 493.218445 , 6.294585 , 7.199996 , [[Camera:ScriptSplineLookAtPosition(637.320,488.898,5.000);]] )
   Camera:MotionSpline_AddSplinePoint( 636.377808 , 496.343170 , 7.186351 , 11.200006 , [[Camera:ScriptSplineLookAtPosition(637.320,488.898,5.000);]] )
   Camera:MotionSpline_AddSplinePoint( 629.319397 , 490.780182 , 6.946354 , 15.800024 , [[Camera:ScriptSplineLookAtPosition(637.320,488.898,5.000);]] )
   Camera:MotionSpline_AddSplinePoint( 630.933655 , 480.877686 , 6.294585 , 19.800039 , [[Camera:ScriptSplineLookAtPosition(637.320,488.898,5.000);]] )
   Camera:MotionSpline_AddSplinePoint( 640.000244 , 479.896912 , 6.254585 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(637.320,488.898,5.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
