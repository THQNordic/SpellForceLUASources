-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 90.827660 , 647.231323 , 52.799564 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
   Camera:MotionSpline_AddSplinePoint( 90.827660 , 647.231323 , 52.799564 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
   Camera:MotionSpline_AddSplinePoint( 90.827660 , 647.231323 , 52.799564 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
   Camera:MotionSpline_AddSplinePoint( 90.827660 , 647.231323 , 52.799564 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11786);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
