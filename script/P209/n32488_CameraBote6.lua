-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 302.635986 , 401.781708 , 61.789574 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(307.940,441.986,16.650);]] )
   Camera:MotionSpline_AddSplinePoint( 302.635986 , 401.781708 , 61.789574 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(307.940,441.986,16.650);]] )
   Camera:MotionSpline_AddSplinePoint( 302.635986 , 401.781708 , 61.789574 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(307.940,441.986,16.650);]] )
   Camera:MotionSpline_AddSplinePoint( 302.635986 , 401.781708 , 61.789574 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(307.940,441.986,16.650);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
