-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 72.424194 , 225.217468 , 12.866693 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(45.687,243.148,17.000);]] )
   Camera:MotionSpline_AddSplinePoint( 72.424194 , 225.217468 , 12.866693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 72.424194 , 225.217468 , 12.866693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 72.424194 , 225.217468 , 12.866693 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 100.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
