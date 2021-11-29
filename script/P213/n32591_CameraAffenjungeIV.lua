-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 211.300598 , 251.480515 , 11.866693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(123.545,226.397,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 211.300598 , 251.480515 , 11.866693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(123.545,226.397,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 211.300598 , 251.480515 , 11.866693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(123.545,226.397,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 211.300598 , 251.480515 , 11.866693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(123.545,226.397,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
