-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 234.385834 , 472.837769 , 66.217445 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(6758);]] )
   Camera:MotionSpline_AddSplinePoint( 235.154175 , 471.149780 , 66.217445 , 5.999997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 235.931351 , 469.442291 , 66.217445 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 236.903778 , 467.305847 , 67.217445 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
