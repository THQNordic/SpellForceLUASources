-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 84.556030 , 49.619057 , 41.862579 , 19.800039 , [[Camera:ScriptSplineLookAtNpc(4191);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 83.573593 , 48.016720 , 41.832470 , 13.100014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 82.592926 , 46.413609 , 41.879669 , 19.700039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 81.713028 , 44.757923 , 41.939632 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
