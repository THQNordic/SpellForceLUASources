-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 211.306946 , 221.557343 , 16.766193 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(211.307,222.209,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 211.306946 , 221.557343 , 16.766193 , 4.899998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 212.306946 , 222.557343 , 16.766193 , 4.899998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 211.306946 , 223.557343 , 16.766193 , 7.399995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 210.306946 , 222.557343 , 16.766193 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 211.306946 , 221.557343 , 16.766193 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
