-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 168.802292 , 191.098389 , 12.658071 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(183.192,201.137,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 170.746750 , 199.083450 , 13.188937 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 167.510773 , 206.400558 , 13.159193 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.965897 , 210.000671 , 11.291227 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
