-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 370.852325 , 467.558594 , 52.797096 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(413.829,468.373,33.000);]] )
   Camera:MotionSpline_AddSplinePoint( 380.774261 , 439.481476 , 52.727097 , 12.900013 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 414.835999 , 439.369080 , 51.257088 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 449.248657 , 443.440460 , 51.907093 , 29.800077 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
