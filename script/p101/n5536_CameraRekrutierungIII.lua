-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 415.534668 , 177.476807 , 13.912546 , 9.400000 , [[Camera:ScriptSplineLookAtNpc(5539);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 415.534668 , 177.476807 , 13.912546 , 6.199996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 415.534668 , 177.476807 , 13.912546 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 415.534668 , 177.476807 , 13.912546 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
