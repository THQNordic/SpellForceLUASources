-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 302.747101 , 388.575562 , 18.706978 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 308.637970 , 389.714844 , 17.706978 , 6.999996 , [[Camera:ScriptSplineLookAtApproachingModifier(0.005);]] )
   Camera:MotionSpline_AddSplinePoint( 312.565216 , 390.474365 , 16.706978 , 9.800001 , [[Camera:ScriptSplineLookAtPosition(346.163,403.176,14.038);]] )
   Camera:MotionSpline_AddSplinePoint( 315.335815 , 393.067902 , 16.206978 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
