-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 114.739082 , 46.041271 , 40.716400 , 8.899998 , [[Camera:ScriptSplineLookAtPosition(115.551,107.414,32.000);]] )
   Camera:MotionSpline_AddSplinePoint( 114.739082 , 46.041271 , 40.716400 , 5.899997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 114.739082 , 46.041271 , 40.716400 , 8.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 115.066422 , 46.363079 , 40.716400 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
