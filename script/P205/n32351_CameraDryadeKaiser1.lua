-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 314.751526 , 394.375580 , 23.510672 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(9320);]] )
   Camera:MotionSpline_AddSplinePoint( 312.518250 , 397.803680 , 22.510672 , 8.199995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 312.652222 , 400.037292 , 18.510672 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 312.357941 , 400.839966 , 17.510672 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
