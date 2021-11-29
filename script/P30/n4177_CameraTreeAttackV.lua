-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 404.718414 , 342.061523 , 41.202534 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(385.315,347.852,30.920);]] )
   Camera:MotionSpline_AddSplinePoint( 405.394745 , 346.097321 , 41.192532 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 405.433472 , 348.157501 , 41.202534 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 405.269318 , 350.207855 , 41.222534 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
