-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 523.329285 , 408.275970 , 48.160946 , 0.000000 , [[Camera:ScriptSplineCreateCutScene(505.346,421.683,51.940,505.411,422.301,51.156,5);
Camera:ScriptSplineCreateCutScene(541.053,420.095,52.684,540.444,420.218,51.901,5);
Camera:ScriptSplineCreateCutScene(499.409,463.639,63.480,498.799,463.762,62.696,5);
Camera:ScriptSplineCreateCutScene(596.319,396.237,76.167,595.571,396.389,75.520,5);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
