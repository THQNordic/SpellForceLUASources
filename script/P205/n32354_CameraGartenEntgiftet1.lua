-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 225.276138 , 402.581757 , 16.356329 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(244.542,399.314,26.091);Camera:ScriptSplineLookAtPosition(207.494,402.542,11.218);]] )
   Camera:MotionSpline_AddSplinePoint( 243.747208 , 398.203094 , 17.356337 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 260.677856 , 395.370789 , 16.356339 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 323.255249 , 387.513153 , 24.356339 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 336.361725 , 387.951355 , 25.455879 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 340.932831 , 389.898895 , 25.957985 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 355.529297 , 396.780823 , 26.920757 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 1.835938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
