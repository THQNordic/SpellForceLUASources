-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 564.764709 , 197.643890 , 65.183327 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(565.820,240.656,64.000);]] )
   Camera:MotionSpline_AddSplinePoint( 564.764709 , 210.033737 , 66.866692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 564.764709 , 229.296677 , 62.866699 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 564.764709 , 235.967239 , 61.866692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
