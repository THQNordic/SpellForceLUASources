-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 325.033997 , 486.962006 , 71.045929 , 90.000000 , [[Camera:ScriptSplineLookAtPosition(325.034,487.962,50.626);]] )
   Camera:MotionSpline_AddSplinePoint( 326.033997 , 487.962006 , 71.045929 , 80.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 325.033997 , 488.962006 , 71.045929 , 70.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 324.033997 , 487.962006 , 71.045929 , 60.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 325.033997 , 486.962006 , 71.045929 , 50.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.033997 , 487.962006 , 71.045929 , 40.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 325.033997 , 488.962006 , 71.045929 , 30.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 324.033997 , 487.962006 , 71.045929 , 20.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 325.033997 , 486.962006 , 71.045929 , 10.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.033997 , 487.962006 , 71.045929 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 90.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
