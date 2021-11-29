-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 254.399902 , 193.288895 , 35.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(266.000,180.686,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 254.399902 , 193.288895 , 35.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(266.000,180.686,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 254.399902 , 193.288895 , 35.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(266.000,180.686,30.000);]] )
   Camera:MotionSpline_AddSplinePoint( 254.399902 , 193.288895 , 35.872471 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(266.000,180.686,30.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
