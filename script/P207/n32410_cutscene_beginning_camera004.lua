-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 370.000000 , 192.000000 , 96.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(415,140,85);]] )
   Camera:MotionSpline_AddSplinePoint( 366.000000 , 188.000000 , 96.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 362.000000 , 184.000000 , 96.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 358.000000 , 180.000000 , 96.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
