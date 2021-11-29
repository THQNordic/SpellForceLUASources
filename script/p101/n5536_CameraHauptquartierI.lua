-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 326.891083 , 444.117065 , 56.444210 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(311.459,409.707,37.000);]] )
   Camera:MotionSpline_AddSplinePoint( 314.326538 , 445.572632 , 56.564205 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 306.391510 , 444.774658 , 56.484211 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 287.157074 , 432.526611 , 59.155674 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 290.594879 , 421.844513 , 66.037598 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 100.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
