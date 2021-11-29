-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 235.851730 , 374.184082 , 23.506193 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(252.675,409.216,16.180);]] )
   Camera:MotionSpline_AddSplinePoint( 242.515411 , 370.607117 , 21.456137 , 6.599996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 249.251999 , 367.164795 , 20.616014 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 256.620514 , 365.052917 , 20.535221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
