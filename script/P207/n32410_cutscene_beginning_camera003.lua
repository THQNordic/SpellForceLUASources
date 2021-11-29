-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 252.000000 , 487.000000 , 58.730732 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(260.000,415.000,32);]] )
   Camera:MotionSpline_AddSplinePoint( 258.000000 , 487.000000 , 58.730732 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 264.000000 , 487.000000 , 58.730732 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 270.000000 , 487.000000 , 58.730732 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
