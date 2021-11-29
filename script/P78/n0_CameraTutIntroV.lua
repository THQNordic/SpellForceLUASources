-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 189.111603 , 558.849915 , 62.236687 , 29.500076 , [[Camera:ScriptSplineLookAtNpc(3354);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);
]] )
   Camera:MotionSpline_AddSplinePoint( 190.506500 , 559.503845 , 61.976692 , 21.300045 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 190.849213 , 559.178711 , 61.976692 , 29.400076 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 191.360397 , 559.074158 , 62.146683 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
