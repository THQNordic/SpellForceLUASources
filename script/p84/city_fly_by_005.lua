-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 166.996277 , 205.412888 , 18.474585 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(158.607,226.442,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 158.895157 , 212.354614 , 20.425194 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 149.983490 , 212.345840 , 21.504578 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 138.201599 , 210.939957 , 18.464584 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
