-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 610.725281 , 394.846466 , 28.094698 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6738);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 610.725281 , 394.846466 , 29.094698 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 610.725281 , 394.846466 , 29.094698 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 610.725281 , 394.846466 , 29.094698 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
