-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 220.201782 , 301.567139 , 32.836655 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(8489);]] )
   Camera:MotionSpline_AddSplinePoint( 213.734192 , 299.968872 , 33.836655 , 7.099996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 209.359543 , 298.849854 , 36.836655 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 202.919464 , 297.459229 , 39.836655 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(218.646,312.179,35.210);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
