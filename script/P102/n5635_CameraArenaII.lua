-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 251.723114 , 512.573059 , 12.094138 , 19.600039 , [[Camera:ScriptSplineLookAtNpc(5635);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 252.492416 , 514.418030 , 12.094138 , 15.500023 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 252.492416 , 514.418030 , 12.094138 , 19.500038 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 252.492416 , 514.418030 , 12.094138 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
