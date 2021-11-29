-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 517.565552 , 438.969330 , 86.804832 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(542,416.400,63.000);]] )
   Camera:MotionSpline_AddSplinePoint( 517.565552 , 438.969330 , 86.804832 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 517.565552 , 438.969330 , 86.804832 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 517.565552 , 438.969330 , 86.804832 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
