-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 383.500000 , 54.900002 , 90.895866 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(380.091,62.851,88.4300);]] )
   Camera:MotionSpline_AddSplinePoint( 383.500000 , 54.900002 , 90.895866 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.500000 , 54.900002 , 90.895866 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 383.500000 , 54.900002 , 90.895866 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
