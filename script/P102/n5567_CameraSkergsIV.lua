-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 44.789036 , 90.677422 , 15.866733 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(59.205,100.266,10.240);]] )
   Camera:MotionSpline_AddSplinePoint( 47.600750 , 88.192986 , 15.256732 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 51.647232 , 87.126350 , 14.556529 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 57.080128 , 87.412704 , 14.296735 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
