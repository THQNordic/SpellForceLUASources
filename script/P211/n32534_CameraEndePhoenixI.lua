-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 137.553940 , 132.968903 , 26.910418 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(141.784,138.960,25.420);]] )
   Camera:MotionSpline_AddSplinePoint( 136.379089 , 131.107452 , 26.910418 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 135.066284 , 129.027390 , 26.810429 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 133.562683 , 126.645058 , 26.810429 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 130.898102 , 121.595383 , 26.810429 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 13.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
