-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 476.620819 , 296.345886 , 20.333229 , 8.099995 , [[Camera:ScriptSplineLookAtPosition(547.566,293.886,14.400);]] )
   Camera:MotionSpline_AddSplinePoint( 487.671509 , 298.494965 , 18.953230 , 4.699998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 498.716583 , 300.642944 , 17.123741 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 514.166626 , 299.823334 , 14.543230 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
