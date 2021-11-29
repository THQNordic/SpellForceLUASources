-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 171.801849 , 471.147614 , 24.952391 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 171.967499 , 466.709381 , 25.962393 , 11.500008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 172.148132 , 461.869904 , 25.682394 , 18.800035 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 172.367889 , 455.982025 , 25.572393 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 168.490829 , 453.383362 , 25.059052 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
