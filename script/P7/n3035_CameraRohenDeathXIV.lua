-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 66.434616 , 52.215919 , 41.556190 , 19.900040 , [[Camera:ScriptSplineLookAtNpc(4185);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 66.434616 , 52.215919 , 42.000000 , 13.200014 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 66.434616 , 52.215919 , 43.000000 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 66.434616 , 52.215919 , 44.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
