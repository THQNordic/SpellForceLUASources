-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 344.102478 , 99.553207 , 36.004375 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(419.824,169.393,32.000);]] )
   Camera:MotionSpline_AddSplinePoint( 370.777527 , 130.403122 , 38.420452 , 14.100018 , [[Camera:ScriptSplineLookAtPosition(419.824,169.393,32.000);]] )
   Camera:MotionSpline_AddSplinePoint( 382.336670 , 151.134628 , 38.140453 , 19.800039 , [[Camera:ScriptSplineLookAtPosition(419.824,169.393,32.000);]] )
   Camera:MotionSpline_AddSplinePoint( 399.189789 , 171.620972 , 38.250454 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(419.824,169.393,32.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
