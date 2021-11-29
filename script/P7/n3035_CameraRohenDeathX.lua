-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 72.294746 , 55.440010 , 41.483173 , 8.599997 , [[Camera:ScriptSplineLookAtNpc(4185);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 72.294746 , 55.440010 , 41.483173 , 5.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 72.294746 , 55.440010 , 41.483173 , 8.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 72.294746 , 55.440010 , 41.483173 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
