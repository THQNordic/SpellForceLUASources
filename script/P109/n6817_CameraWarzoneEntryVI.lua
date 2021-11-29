-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 640.809143 , 280.351105 , 8.432395 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(655.640,310.392,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 642.160217 , 279.379211 , 8.372396 , 4.399998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 645.027405 , 278.306183 , 8.372396 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 650.770813 , 276.590454 , 8.372794 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
