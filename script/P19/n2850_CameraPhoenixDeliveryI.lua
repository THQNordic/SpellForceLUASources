-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 355.273926 , 446.224396 , 82.106598 , 45.199883 , [[Camera:ScriptSplineLookAtPosition(375.907,456.877,77.470);]] )
   Camera:MotionSpline_AddSplinePoint( 351.894073 , 451.210754 , 82.096596 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 351.916321 , 458.940582 , 82.126595 , 45.099884 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 356.964966 , 466.924774 , 82.146599 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 45.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
