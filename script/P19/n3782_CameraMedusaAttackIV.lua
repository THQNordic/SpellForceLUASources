-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 301.209198 , 88.004684 , 53.896793 , 29.600077 , [[Camera:ScriptSplineLookAtPosition(308.382,76.594,52.000);]] )
   Camera:MotionSpline_AddSplinePoint( 298.888489 , 85.027550 , 52.886791 , 20.300041 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 297.501038 , 82.419273 , 52.896793 , 29.500076 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 296.839355 , 79.104401 , 52.896793 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
