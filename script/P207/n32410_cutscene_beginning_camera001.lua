-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 403.000000 , 650.000000 , 41.764233 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(403.267,675.150,26.000);]] )
   Camera:MotionSpline_AddSplinePoint( 403.000000 , 650.000000 , 41.764233 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 403.000000 , 650.000000 , 41.764233 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 403.000000 , 650.000000 , 41.764233 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
