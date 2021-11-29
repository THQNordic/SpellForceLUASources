-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 227.083984 , 276.378510 , 17.294615 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(276.142,269.987,21.000);]] )
   Camera:MotionSpline_AddSplinePoint( 227.083984 , 276.378510 , 17.294615 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 227.083984 , 276.378510 , 17.294615 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 227.083984 , 276.378510 , 17.294615 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
