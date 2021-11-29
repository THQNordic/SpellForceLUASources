-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 255.901642 , 277.847809 , 17.396099 , 8.099995 , [[Camera:ScriptSplineLookAtPosition(194.095,277.042,17.556);]] )
   Camera:MotionSpline_AddSplinePoint( 248.557922 , 277.339081 , 17.396059 , 5.299997 , [[Camera:ScriptSplineLookAtApproachingModifier(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 243.057312 , 276.849731 , 17.592249 , 7.999995 , [[Camera:ScriptSplineLookAtNpc(8787);]] )
   Camera:MotionSpline_AddSplinePoint( 236.132935 , 275.265076 , 17.636097 , 8.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
