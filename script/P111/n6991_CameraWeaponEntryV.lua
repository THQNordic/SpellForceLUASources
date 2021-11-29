-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 398.347046 , 58.174469 , 19.160948 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(404.750,67.220,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 402.851929 , 55.341412 , 19.385658 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 406.944061 , 55.619190 , 19.440155 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 410.053833 , 56.050621 , 19.370161 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
