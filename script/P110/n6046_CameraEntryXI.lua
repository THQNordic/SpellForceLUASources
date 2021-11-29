-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 471.032135 , 345.690521 , 40.848808 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(510.414,371.581,27.590);]] )
   Camera:MotionSpline_AddSplinePoint( 472.217102 , 339.508911 , 37.619324 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 488.594513 , 344.920319 , 24.618904 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 493.095947 , 341.289612 , 24.618570 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
