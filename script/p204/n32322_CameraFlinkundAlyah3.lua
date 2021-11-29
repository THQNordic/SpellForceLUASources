-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 232.761978 , 274.520813 , 16.959539 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(390.406,611.345,46.483);]] )
   Camera:MotionSpline_AddSplinePoint( 232.761978 , 274.520813 , 16.959539 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 232.761978 , 274.520813 , 16.959539 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 232.761978 , 274.520813 , 16.959539 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
