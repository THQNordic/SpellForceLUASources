-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 420.214325 , 550.386047 , 17.255917 , 29.800077 , [[Camera:ScriptSplineLookAtPosition(430.162,549.758,14.000);]] )
   Camera:MotionSpline_AddSplinePoint( 422.559692 , 547.850342 , 17.255917 , 18.500034 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 425.171692 , 545.989746 , 17.255917 , 29.700077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.050934 , 544.798157 , 17.255917 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
