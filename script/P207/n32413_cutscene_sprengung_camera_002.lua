-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 530.000000 , 421.350000 , 66.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(560,421.350,66.000);]] )
   Camera:MotionSpline_AddSplinePoint( 531.000000 , 421.350000 , 66.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 532.000000 , 421.350000 , 66.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 533.000000 , 421.350000 , 66.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
