-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 552.167419 , 142.037582 , 9.333715 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 548.238098 , 139.819992 , 9.243738 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 542.676697 , 138.615982 , 9.223716 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
   Camera:MotionSpline_AddSplinePoint( 536.742615 , 139.369553 , 9.144099 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9010);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
