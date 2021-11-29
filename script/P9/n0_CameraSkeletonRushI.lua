-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 329.816345 , 77.229218 , 49.172749 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(314.416,47.319,50.570);]] )
   Camera:MotionSpline_AddSplinePoint( 330.367371 , 78.469009 , 49.162739 , 5.999997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 330.955719 , 79.792770 , 49.132766 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 331.680267 , 81.422935 , 49.152543 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
