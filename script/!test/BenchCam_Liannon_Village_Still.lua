-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 232.952911 , 151.365250 , 11.621640 , 0.000000 , [[Camera:ScriptSplineCreateCutScene(234.929,154.838,11.800,234.435,153.970,11.755,5);
Camera:ScriptSplineCreateCutScene(207.645,141.819,12.320,208.252,141.044,12.143,5);
Camera:ScriptSplineCreateCutScene(216.560,126.983,12.000,217.544,126.995,11.823,5);
Camera:ScriptSplineCreateCutScene(221.525,117.515,12.000,221.541,118.508,11.888,5);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
