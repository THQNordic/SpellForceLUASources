-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 378.381409 , 442.181366 , 58.950470 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8794);]] )
   Camera:MotionSpline_AddSplinePoint( 377.161530 , 442.750305 , 58.950470 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.224487 , 444.253052 , 58.950470 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 375.731232 , 445.290863 , 58.950470 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
