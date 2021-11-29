-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 174.573410 , 385.124695 , 16.510624 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(158.701,428.987,31.479);]] )
   Camera:MotionSpline_AddSplinePoint( 173.362305 , 392.457458 , 20.481649 , 13.900017 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 168.902252 , 400.333771 , 23.350979 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 167.416031 , 407.672791 , 24.700695 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
