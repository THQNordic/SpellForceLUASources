-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 153.131760 , 187.510620 , 16.536213 , 9.400000 , [[Camera:ScriptSplineLookAtPosition(147.102,216.893,15.000)]] )
   Camera:MotionSpline_AddSplinePoint( 153.131760 , 187.510620 , 16.536213 , 6.199996 , [[Camera:ScriptSplineLookAtPosition(147.102,216.893,15.000)]] )
   Camera:MotionSpline_AddSplinePoint( 153.131760 , 187.510620 , 16.536213 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(147.102,216.893,15.000)]] )
   Camera:MotionSpline_AddSplinePoint( 153.131760 , 187.510620 , 16.536213 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(147.102,216.893,15.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
