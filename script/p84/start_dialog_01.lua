-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 274.010010 , 198.962540 , 17.116194 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(277.284,211.053,14);]] )
   Camera:MotionSpline_AddSplinePoint( 275.010010 , 198.962540 , 17.116194 , 14.900021 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 276.010010 , 198.962540 , 17.116194 , 14.900021 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 277.010010 , 198.962540 , 17.116194 , 14.900021 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
