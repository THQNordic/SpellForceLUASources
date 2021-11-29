-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 275.694611 , 212.905441 , 13.700000 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(274.367,214.204,14.500);]] )
   Camera:MotionSpline_AddSplinePoint( 275.694611 , 212.905441 , 13.700000 , 14.900021 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 275.694611 , 212.905441 , 13.700000 , 14.900021 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 275.694611 , 212.905441 , 13.700000 , 14.900021 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
