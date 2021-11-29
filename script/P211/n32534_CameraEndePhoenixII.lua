-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 131.951294 , 128.672409 , 24.220678 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 131.548981 , 128.926514 , 24.220678 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 130.131668 , 129.463928 , 24.220678 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 128.288528 , 130.159622 , 24.220678 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 127.177322 , 130.620544 , 24.220678 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
