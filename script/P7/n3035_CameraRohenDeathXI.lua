-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 69.495415 , 55.726234 , 41.607265 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(4185);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 67.253326 , 52.820381 , 41.627335 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 64.339218 , 52.114555 , 41.677265 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 60.586971 , 52.618855 , 41.757259 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
