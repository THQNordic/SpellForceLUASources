-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 47.235672 , 245.063049 , 13.776692 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10366);]] )
   Camera:MotionSpline_AddSplinePoint( 47.235672 , 245.063049 , 13.776692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 47.235672 , 245.063049 , 13.776692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 47.235672 , 245.063049 , 13.776692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
