-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 424.766693 , 584.746826 , 216.397446 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(433.812,569.016,210.000);]] )
   Camera:MotionSpline_AddSplinePoint( 421.270691 , 582.482056 , 217.397446 , 12.300011 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 418.468994 , 579.194153 , 218.397446 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 416.040100 , 574.535522 , 219.397446 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
