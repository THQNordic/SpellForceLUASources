-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 216.192444 , 131.642670 , 34.077335 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(215.354,154.109,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 216.192444 , 131.642670 , 34.077335 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(215.354,154.109,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 216.192444 , 131.642670 , 34.077335 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(215.354,154.109,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 216.192444 , 131.642670 , 34.077335 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(215.354,154.109,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
