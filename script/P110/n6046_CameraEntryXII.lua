-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 587.764465 , 373.493805 , 28.220448 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(552.977,351.137,24.286);]] )
   Camera:MotionSpline_AddSplinePoint( 591.865417 , 371.234680 , 27.260445 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 598.377380 , 364.547668 , 28.340443 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 602.763855 , 355.232422 , 35.410442 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 610.059448 , 352.075562 , 41.858696 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
