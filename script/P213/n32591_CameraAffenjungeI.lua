-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 252.056778 , 257.299652 , 12.546497 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10985);]] )
   Camera:MotionSpline_AddSplinePoint( 247.554077 , 254.485931 , 12.366501 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 243.174957 , 251.838425 , 12.356644 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 220.340530 , 236.946594 , 12.366501 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 14.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
