-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 344.802673 , 276.467499 , 27.299513 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(379.403,266.437,25.990);]] )
   Camera:MotionSpline_AddSplinePoint( 349.834839 , 275.079315 , 27.299513 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 353.629242 , 274.032593 , 27.299513 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 359.054535 , 272.535950 , 27.299513 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 9.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
