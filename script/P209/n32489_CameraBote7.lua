-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 331.047363 , 444.115021 , 33.933388 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8661);]] )
   Camera:MotionSpline_AddSplinePoint( 331.047363 , 444.115021 , 33.933388 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8661);]] )
   Camera:MotionSpline_AddSplinePoint( 331.047363 , 444.115021 , 33.933388 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8661);]] )
   Camera:MotionSpline_AddSplinePoint( 331.047363 , 444.115021 , 33.933388 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8661);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
