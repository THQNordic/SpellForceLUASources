-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 490.500000 , 621.500000 , 27.500000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(476.500,626.200,22.500);]] )
   Camera:MotionSpline_AddSplinePoint( 490.500000 , 621.500000 , 27.500000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 490.500000 , 621.500000 , 27.500000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 490.500000 , 621.500000 , 27.500000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
