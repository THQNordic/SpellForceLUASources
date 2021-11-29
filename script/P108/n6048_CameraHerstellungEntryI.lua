-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 249.434540 , 499.248352 , 63.978313 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(162.799,460.885,68.000);]] )
   Camera:MotionSpline_AddSplinePoint( 247.887527 , 493.534607 , 64.518311 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 254.768799 , 489.068756 , 69.650650 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 246.830292 , 478.104095 , 71.980721 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
