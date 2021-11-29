-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 363.729584 , 317.169647 , 52.231197 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(355.049,318.235,52.000);]] )
   Camera:MotionSpline_AddSplinePoint( 367.727661 , 317.866882 , 53.450016 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(355.049,318.235,52.000);]] )
   Camera:MotionSpline_AddSplinePoint( 367.893250 , 319.774292 , 53.420017 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(355.049,318.235,52.000);]] )
   Camera:MotionSpline_AddSplinePoint( 368.923706 , 331.644196 , 54.430016 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(355.049,318.235,52.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
