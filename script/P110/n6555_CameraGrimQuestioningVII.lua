-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 611.418457 , 398.971069 , 28.095654 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(6806);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 611.201904 , 398.059631 , 28.095654 , 6.299996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 610.984436 , 397.144135 , 28.095654 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 611.225342 , 396.124969 , 28.095654 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
