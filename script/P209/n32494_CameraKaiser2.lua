-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 290.592957 , 442.453339 , 13.293024 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(291.500,443.562,13.100);]] )
   Camera:MotionSpline_AddSplinePoint( 290.592957 , 442.453339 , 13.293024 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(291.500,443.562,13.100);]] )
   Camera:MotionSpline_AddSplinePoint( 290.592957 , 442.453339 , 13.293024 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(291.500,443.562,13.100);]] )
   Camera:MotionSpline_AddSplinePoint( 290.592957 , 442.453339 , 13.293024 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(291.500,443.562,13.100);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
