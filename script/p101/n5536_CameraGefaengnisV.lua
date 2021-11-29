-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 359.526031 , 170.263580 , 31.637833 , 9.700001 , [[Camera:ScriptSplineLookAtNpc(6116);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,3.5);]] )
   Camera:MotionSpline_AddSplinePoint( 359.526031 , 170.263580 , 31.637833 , 7.599995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 359.526031 , 170.263580 , 31.637833 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 359.526031 , 170.263580 , 31.637833 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
