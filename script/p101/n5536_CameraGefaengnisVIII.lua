-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 358.731995 , 170.187256 , 31.708071 , 14.700020 , [[Camera:ScriptSplineLookAtNpc(7010);
Camera:ScriptSplineAddTargetLookAtOffset(0,-0.5,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 356.806519 , 169.613419 , 31.708071 , 12.600012 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 356.806519 , 169.613419 , 31.708071 , 14.600019 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 356.806519 , 169.613419 , 31.708071 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
