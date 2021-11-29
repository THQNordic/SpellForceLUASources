-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 389.687286 , 182.548111 , 45.014782 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(414.103,209.679,18.920);]] )
   Camera:MotionSpline_AddSplinePoint( 401.342560 , 176.699829 , 44.594791 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 416.354065 , 176.337204 , 41.664967 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 429.052399 , 182.865463 , 37.082928 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
