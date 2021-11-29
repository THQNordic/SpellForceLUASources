-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 52.933319 , 63.088814 , 22.958809 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(57.127,67.398,19.500);]] )
   Camera:MotionSpline_AddSplinePoint( 52.933319 , 63.088814 , 22.958809 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(57.127,67.398,19.500);]] )
   Camera:MotionSpline_AddSplinePoint( 52.933319 , 63.088814 , 22.958809 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(57.127,67.398,19.500);]] )
   Camera:MotionSpline_AddSplinePoint( 52.933319 , 63.088814 , 22.958809 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(57.127,67.398,19.500);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
