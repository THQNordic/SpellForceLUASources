-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 455.185120 , 287.595337 , 63.652313 , 11.900009 , [[Camera:ScriptSplineLookAtPosition(420.413,337.276,32.600);]] )
   Camera:MotionSpline_AddSplinePoint( 466.512054 , 297.396667 , 63.672340 , 6.999996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 474.469635 , 315.388458 , 61.642395 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 477.097229 , 339.090424 , 60.152390 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
