-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 552.688904 , 139.949509 , 9.115891 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 552.688904 , 139.949509 , 9.115891 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 552.688904 , 139.949509 , 9.115891 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 552.688904 , 139.949509 , 9.115891 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
