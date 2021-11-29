-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 200.707291 , 292.496674 , 27.023712 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(206.717,319.518,24.000);]] )
   Camera:MotionSpline_AddSplinePoint( 205.784927 , 290.413696 , 27.023712 , 11.700008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 211.438492 , 290.160431 , 26.023712 , 19.800039 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 217.875015 , 294.506683 , 24.983711 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
