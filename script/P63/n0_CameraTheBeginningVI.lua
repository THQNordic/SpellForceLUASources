-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 85.251549 , 306.418060 , 37.567432 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(104.460,343.896,26.610);]] )
   Camera:MotionSpline_AddSplinePoint( 87.251549 , 306.418060 , 37.567432 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 89.251549 , 306.418060 , 37.567432 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 90.251549 , 306.418060 , 37.567432 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
