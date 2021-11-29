-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 356.526031 , 171.263580 , 31.637835 , 9.700001 , [[Camera:ScriptSplineLookAtNpc(7010);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 356.526031 , 170.263580 , 31.637835 , 7.599995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 356.526031 , 170.263580 , 31.637835 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 356.526031 , 170.263580 , 31.637835 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
