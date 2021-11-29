-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 82.761566 , 459.772461 , 42.093620 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(103.313,523.018,34.760);]] )
   Camera:MotionSpline_AddSplinePoint( 103.722420 , 468.115417 , 48.133621 , 5.399997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 116.394318 , 470.557281 , 50.263599 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 141.693054 , 484.981201 , 36.833618 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.664063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
