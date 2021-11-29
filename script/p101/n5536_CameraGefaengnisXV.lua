-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 362.550507 , 171.281860 , 30.833101 , 9.500000 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 362.550507 , 171.281860 , 30.833101 , 6.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 362.550507 , 171.281860 , 30.833101 , 9.400000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 362.550507 , 171.281860 , 30.833101 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
