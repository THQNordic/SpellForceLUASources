-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 215.704147 , 174.560669 , 42.136402 , 9.400000 , [[Camera:ScriptSplineLookAtPosition(215.136,151.034,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 215.704147 , 174.560669 , 42.136402 , 6.199996 , [[Camera:ScriptSplineLookAtPosition(215.136,151.034,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 215.704147 , 174.560669 , 42.136402 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(215.136,151.034,15.000);]] )
   Camera:MotionSpline_AddSplinePoint( 215.704147 , 174.560669 , 42.136402 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(215.136,151.034,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
