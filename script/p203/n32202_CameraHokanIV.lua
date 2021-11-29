-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 659.210510 , 633.993652 , 8.866703 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(676.547,644.420,10.020);]] )
   Camera:MotionSpline_AddSplinePoint( 659.210510 , 633.993652 , 8.866693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 659.210510 , 633.993652 , 8.866693 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 659.210510 , 633.993652 , 8.866693 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
   Camera:MotionSpline_SetCorrection( 0.820313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
