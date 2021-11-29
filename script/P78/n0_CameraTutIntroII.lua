-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 200.886581 , 556.702942 , 62.116699 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(3354);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 202.165619 , 558.271667 , 62.326691 , 5.899997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 203.508545 , 559.541626 , 62.566673 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 205.358582 , 562.629761 , 62.376694 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
