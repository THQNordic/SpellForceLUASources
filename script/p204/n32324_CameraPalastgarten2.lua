-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 237.956070 , 480.216339 , 46.678223 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(191.448,479.544,42.565);]] )
   Camera:MotionSpline_AddSplinePoint( 234.984268 , 479.805817 , 46.678223 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.984268 , 479.805817 , 46.678223 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.984268 , 479.805817 , 46.678223 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
