-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 381.074341 , 573.241394 , 44.597725 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 386.332062 , 557.588623 , 49.267727 , 13.200014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 393.976257 , 529.611938 , 60.507729 , 19.300037 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 389.734161 , 508.755585 , 53.467728 , 24.800058 , [[Camera:ScriptSplineLookAtNpc(2016);
Camera:ScriptSplineLookAtApproachingModifier(0.1);]] )
   Camera:MotionSpline_AddSplinePoint( 375.738373 , 495.238678 , 53.517723 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(2016);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
