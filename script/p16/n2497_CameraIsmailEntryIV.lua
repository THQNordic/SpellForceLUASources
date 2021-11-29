-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.531952 , 568.273071 , 39.573803 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(464.097,564.896,50.461);]] )
   Camera:MotionSpline_AddSplinePoint( 401.575531 , 545.770874 , 44.149548 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 418.623688 , 536.956299 , 46.164726 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 466.798523 , 538.611023 , 52.511936 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
