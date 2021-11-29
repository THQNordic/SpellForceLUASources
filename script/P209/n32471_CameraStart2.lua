-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 174.300446 , 623.845642 , 52.442516 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(136.577,654.729,49.461);]] )
   Camera:MotionSpline_AddSplinePoint( 171.837524 , 626.389893 , 52.442516 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(136.577,654.729,49.461);]] )
   Camera:MotionSpline_AddSplinePoint( 169.674454 , 628.736877 , 52.442516 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(136.577,654.729,49.461);]] )
   Camera:MotionSpline_AddSplinePoint( 167.449600 , 631.641052 , 52.482517 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(136.577,654.729,49.461);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
