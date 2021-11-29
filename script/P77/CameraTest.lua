-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 103.428452 , 62.655014 , 26.269402 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 103.984367 , 76.548180 , 22.269402 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 104.642433 , 91.437935 , 16.269402 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 105.327560 , 104.449188 , 13.269402 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
