-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 584.955139 , 385.600220 , 60.881409 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3030);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 587.885498 , 389.261536 , 61.281406 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 587.885498 , 389.261536 , 61.281406 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 587.885498 , 389.261536 , 61.281406 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
