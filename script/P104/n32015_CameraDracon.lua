-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 251.723679 , 483.909241 , 67.483223 , 29.800077 , [[Camera:ScriptSplineLookAtPosition(243.344,514.470,60.537);]] )
   Camera:MotionSpline_AddSplinePoint( 251.723679 , 483.909241 , 67.483223 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 251.723679 , 483.909241 , 67.483223 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 251.723679 , 483.909241 , 67.483223 , 29.800077 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
