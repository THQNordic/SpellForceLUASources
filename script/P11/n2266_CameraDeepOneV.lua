-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 120.747543 , 530.981506 , 48.336689 , 9.700001 , [[Camera:ScriptSplineLookAtPosition(167.756,505.922,32.910);]] )
   Camera:MotionSpline_AddSplinePoint( 120.747543 , 530.981506 , 48.336689 , 6.399996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 120.747543 , 530.981506 , 48.336689 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 120.747543 , 530.981506 , 48.336689 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
