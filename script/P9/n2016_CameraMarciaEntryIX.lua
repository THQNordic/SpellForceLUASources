-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 210.049362 , 336.567413 , 55.532501 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(216.249,306.006,37.000);]] )
   Camera:MotionSpline_AddSplinePoint( 206.128311 , 341.758423 , 60.649673 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(216.249,306.006,37.000);]] )
   Camera:MotionSpline_AddSplinePoint( 201.842712 , 347.934174 , 65.501472 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(216.249,306.006,37.000);]] )
   Camera:MotionSpline_AddSplinePoint( 193.614990 , 358.463867 , 76.242004 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(216.249,306.006,37.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
