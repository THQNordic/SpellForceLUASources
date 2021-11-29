-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 531.696960 , 439.868256 , 68.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10764);]] )
   Camera:MotionSpline_AddSplinePoint( 534.671692 , 438.795410 , 68.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 536.622375 , 436.747253 , 68.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 537.524658 , 432.724091 , 68.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
