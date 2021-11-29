-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 314.761719 , 389.767181 , 18.136623 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 315.382111 , 387.761658 , 17.273582 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 315.401703 , 385.761780 , 17.273582 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 315.411499 , 384.761841 , 16.273582 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
