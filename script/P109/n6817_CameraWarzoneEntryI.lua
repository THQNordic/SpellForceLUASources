-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 67.918709 , 97.813538 , 53.668518 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(67.494,119.550,39.420);]] )
   Camera:MotionSpline_AddSplinePoint( 76.335861 , 98.370590 , 53.668518 , 8.999998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 81.575058 , 104.355499 , 53.409687 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 82.174644 , 124.559189 , 53.678158 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
