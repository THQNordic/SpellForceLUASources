-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 367.295563 , 347.578552 , 19.975840 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(384.289,314.986,15.530);]] )
   Camera:MotionSpline_AddSplinePoint( 364.950500 , 344.160156 , 20.315891 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 363.577972 , 339.097626 , 20.225843 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 362.563141 , 329.756653 , 20.235867 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
