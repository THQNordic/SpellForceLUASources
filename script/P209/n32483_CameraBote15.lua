-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 409.149780 , 354.110199 , 19.046803 , 9.700001 , [[Camera:ScriptSplineLookAtNpc(9802);]] )
   Camera:MotionSpline_AddSplinePoint( 409.149780 , 354.110199 , 19.046803 , 6.399996 , [[Camera:ScriptSplineLookAtNpc(9802);]] )
   Camera:MotionSpline_AddSplinePoint( 409.149780 , 354.110199 , 19.046803 , 9.600000 , [[Camera:ScriptSplineLookAtNpc(9802);]] )
   Camera:MotionSpline_AddSplinePoint( 409.149780 , 354.110199 , 19.046803 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9802);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
