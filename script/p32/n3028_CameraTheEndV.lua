-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 558.728516 , 533.865601 , 70.234177 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(556.787,521.607,69.830);]] )
   Camera:MotionSpline_AddSplinePoint( 558.728516 , 538.072998 , 70.903244 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 558.728516 , 542.757263 , 71.193161 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 558.728516 , 547.396118 , 71.363281 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
