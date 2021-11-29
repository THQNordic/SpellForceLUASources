-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 248.715805 , 192.488602 , 36.746017 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(277.879,169.633,27.000);]] )
   Camera:MotionSpline_AddSplinePoint( 248.715805 , 192.488602 , 36.746017 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(277.879,169.633,27.000);]] )
   Camera:MotionSpline_AddSplinePoint( 248.715805 , 192.488602 , 36.746017 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(277.879,169.633,27.000);]] )
   Camera:MotionSpline_AddSplinePoint( 248.715805 , 192.488602 , 36.746017 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(277.879,169.633,27.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
