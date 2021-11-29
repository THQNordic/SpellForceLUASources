-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 388.218506 , 437.665375 , 58.687386 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(8793);]] )
   Camera:MotionSpline_AddSplinePoint( 390.453552 , 438.702332 , 58.687386 , 5.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 392.293365 , 440.403931 , 58.687386 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 393.850616 , 443.775085 , 58.687386 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
