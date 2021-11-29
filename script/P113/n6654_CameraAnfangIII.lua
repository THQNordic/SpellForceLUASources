-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 387.628571 , 218.690552 , 81.657784 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(384.769,280.192,0.000);]] )
   Camera:MotionSpline_AddSplinePoint( 387.648590 , 223.402664 , 80.657784 , 6.699996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 387.470703 , 227.019836 , 78.188065 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(384.769,280.192,0.000);]] )
   Camera:MotionSpline_AddSplinePoint( 387.290161 , 230.691391 , 76.117790 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
