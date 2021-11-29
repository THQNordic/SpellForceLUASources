-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 423.214325 , 547.386047 , 16.255917 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(428.254,552.011,14.000);]] )
   Camera:MotionSpline_AddSplinePoint( 425.559692 , 545.850342 , 16.255917 , 10.000002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.171692 , 544.989746 , 16.255917 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 433.050934 , 545.798157 , 16.255917 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
