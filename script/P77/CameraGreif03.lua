-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 109.056358 , 31.675320 , 19.366501 , 5.099998 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 115.606483 , 45.819984 , 19.366501 , 3.499999 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 109.135689 , 57.381897 , 19.366501 , 4.999998 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
   Camera:MotionSpline_AddSplinePoint( 97.651413 , 59.149368 , 19.366501 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5118);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
