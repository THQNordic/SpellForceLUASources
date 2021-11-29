-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 384.314117 , 261.779999 , 27.215630 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 384.314117 , 261.779999 , 27.215630 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 384.314117 , 261.779999 , 27.215630 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 384.314117 , 261.779999 , 27.215630 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 17.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
