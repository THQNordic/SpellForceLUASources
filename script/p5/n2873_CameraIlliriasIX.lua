-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 588.546875 , 482.797882 , 41.505486 , 24.900059 , [[Camera:ScriptSplineLookAtPosition(595.014,447.879,45.000);]] )
   Camera:MotionSpline_AddSplinePoint( 590.356689 , 482.885101 , 41.545483 , 4.799998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 594.171021 , 481.198761 , 42.065025 , 10.000002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 599.940430 , 477.746521 , 43.132301 , 16.100025 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 602.137756 , 470.153076 , 43.725487 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 600.719360 , 458.918365 , 45.555477 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
