-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 512.059326 , 258.830811 , 39.070141 , 34.600044 , [[Camera:ScriptSplineLookAtNpc(4461);
Camera:ScriptSplineAddTargetLookAtOffset(0,-2,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 511.479126 , 260.157318 , 39.050140 , 21.200045 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 510.807465 , 261.489319 , 38.740143 , 34.500046 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 511.109009 , 263.411743 , 38.422192 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 35.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
