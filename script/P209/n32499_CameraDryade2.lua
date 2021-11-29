-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 670.907166 , 413.520081 , 7.749477 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11701);]] )
   Camera:MotionSpline_AddSplinePoint( 670.907166 , 413.520081 , 7.749477 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11701);]] )
   Camera:MotionSpline_AddSplinePoint( 670.907166 , 413.520081 , 7.749477 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11701);]] )
   Camera:MotionSpline_AddSplinePoint( 670.907166 , 413.520081 , 7.749477 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11701);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
