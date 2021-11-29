-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 137.363388 , 143.543228 , 24.671783 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 137.363388 , 143.543228 , 24.671783 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 137.363388 , 143.543228 , 24.671783 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
   Camera:MotionSpline_AddSplinePoint( 137.363388 , 143.543228 , 24.671783 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10106);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
