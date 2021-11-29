-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 690.986938 , 553.855896 , 12.056534 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(660.688,551.357,12.788);]] )
   Camera:MotionSpline_AddSplinePoint( 690.986938 , 553.856262 , 12.056064 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 690.986938 , 553.856262 , 12.056057 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 690.986938 , 553.856262 , 12.056057 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
