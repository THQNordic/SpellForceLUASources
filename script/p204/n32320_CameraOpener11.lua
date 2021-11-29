-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 389.959106 , 446.512329 , 58.390965 , 11.900009 , [[Camera:ScriptSplineLookAtNpc(8793);]] )
   Camera:MotionSpline_AddSplinePoint( 389.791504 , 445.271179 , 58.390965 , 7.799995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 392.017273 , 442.456635 , 59.390965 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 394.170685 , 442.084259 , 59.390965 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
