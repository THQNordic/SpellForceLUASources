-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 572.385315 , 375.031769 , 61.802998 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(586.828,382.687,59.000);]] )
   Camera:MotionSpline_AddSplinePoint( 572.385315 , 375.031769 , 61.802998 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 572.385315 , 375.031769 , 61.802998 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 572.385315 , 375.031769 , 61.802998 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
