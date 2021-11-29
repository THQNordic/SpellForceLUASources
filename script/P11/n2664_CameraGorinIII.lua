-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 521.253723 , 488.139374 , 29.374685 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(556.478,497.146,42.632);
]] )
   Camera:MotionSpline_AddSplinePoint( 527.623535 , 489.037994 , 30.640141 , 5.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 532.270325 , 489.801880 , 32.244961 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 540.735535 , 490.690125 , 34.234962 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
