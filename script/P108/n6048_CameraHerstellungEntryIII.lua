-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 234.226730 , 477.578857 , 64.255554 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6048);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.0);]] )
   Camera:MotionSpline_AddSplinePoint( 234.226730 , 477.578857 , 64.255554 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.226730 , 477.578857 , 64.255554 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.226730 , 477.578857 , 64.255554 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
