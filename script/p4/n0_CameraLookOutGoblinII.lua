-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 281.798370 , 303.515137 , 42.936859 , 11.900009 , [[Camera:ScriptSplineLookAtNpc(3108);]] )
   Camera:MotionSpline_AddSplinePoint( 306.811920 , 300.630096 , 47.448833 , 8.899998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 358.837708 , 294.629486 , 57.168362 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 384.247253 , 295.929504 , 64.189072 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.898438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
