-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 457.703430 , 223.280716 , 26.324291 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8787);]] )
   Camera:MotionSpline_AddSplinePoint( 457.706665 , 223.281021 , 26.324291 , 0.000000 , [[Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 457.706665 , 223.281021 , 26.324291 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9895);]] )
   Camera:MotionSpline_AddSplinePoint( 457.706665 , 223.281021 , 26.324291 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 457.664063 , 219.738449 , 30.705372 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
