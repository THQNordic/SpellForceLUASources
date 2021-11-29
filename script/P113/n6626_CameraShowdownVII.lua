-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 204.697617 , 319.779572 , 23.045559 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 205.509995 , 317.027679 , 23.045559 , 6.799996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 206.174835 , 314.778992 , 23.045559 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 206.708282 , 312.974640 , 23.045559 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
