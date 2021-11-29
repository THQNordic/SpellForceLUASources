-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 436.448669 , 404.611481 , 37.391350 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(480.944,484.161,28.660);]] )
   Camera:MotionSpline_AddSplinePoint( 438.016296 , 400.868225 , 38.531258 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 443.242188 , 397.753571 , 38.531342 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(480.944,484.161,28.660);]] )
   Camera:MotionSpline_AddSplinePoint( 446.824066 , 397.341248 , 38.531342 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
