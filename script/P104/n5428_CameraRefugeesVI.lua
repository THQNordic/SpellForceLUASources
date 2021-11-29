-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 632.361877 , 52.406040 , 62.674980 , 19.300037 , [[Camera:ScriptSplineLookAtPosition(631.382,102.385,10.000);]] )
   Camera:MotionSpline_AddSplinePoint( 632.361877 , 52.406040 , 62.674980 , 12.800013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 632.361877 , 52.406040 , 62.674980 , 19.200037 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 632.361877 , 52.406040 , 62.674980 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
