-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 71.633194 , 51.319473 , 41.163025 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 71.633194 , 51.319473 , 41.163025 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 71.633194 , 51.319473 , 41.163025 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 71.633194 , 51.319473 , 41.163025 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )