-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 322.198151 , 368.448395 , 26.520554 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 312.270508 , 368.164185 , 26.530556 , 5.899997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 304.061127 , 376.779541 , 26.530556 , 9.400000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 304.768829 , 390.440308 , 26.500557 , 12.700012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 314.241364 , 398.885101 , 26.150562 , 16.600027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.052795 , 397.129944 , 26.500534 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 333.849518 , 388.127075 , 26.530556 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
