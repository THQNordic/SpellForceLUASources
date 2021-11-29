-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 126.248459 , 298.140442 , 41.479382 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(3448);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 121.513496 , 288.211548 , 39.489380 , 6.599996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 126.050507 , 276.179657 , 36.599377 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 136.128693 , 272.038788 , 41.429134 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
