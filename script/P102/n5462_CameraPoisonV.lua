-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 365.127686 , 280.478149 , 9.551004 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(345.492,327.913,10.688);]] )
   Camera:MotionSpline_AddSplinePoint( 367.347443 , 281.654114 , 9.551004 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 369.820587 , 282.987366 , 10.600993 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 372.255402 , 284.346680 , 11.551259 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
