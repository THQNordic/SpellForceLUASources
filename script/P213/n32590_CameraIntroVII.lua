-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 618.959595 , 318.122375 , 46.015221 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11183);]] )
   Camera:MotionSpline_AddSplinePoint( 618.959595 , 315.945129 , 87.911064 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 618.959595 , 313.766266 , 123.825935 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 618.959595 , 309.408478 , 145.635681 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
