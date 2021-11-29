-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 288.014709 , 123.157837 , 26.839222 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(303.002,150.181,17.390);]] )
   Camera:MotionSpline_AddSplinePoint( 288.014709 , 123.157837 , 25.839222 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 288.014709 , 123.157837 , 25.839222 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 288.014709 , 123.157837 , 24.839222 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
