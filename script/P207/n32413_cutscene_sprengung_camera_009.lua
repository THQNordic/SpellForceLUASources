-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 532.987000 , 418.592987 , 65.099998 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(539.987,418.593,65.100);]] )
   Camera:MotionSpline_AddSplinePoint( 530.987000 , 418.592987 , 67.099998 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 528.987000 , 418.592987 , 69.099998 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 526.987000 , 418.592987 , 71.099998 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 524.987000 , 418.592987 , 73.858658 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 522.987000 , 418.592987 , 75.858658 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 17.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
