-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 60.714561 , 234.116302 , 12.746693 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10048);]] )
   Camera:MotionSpline_AddSplinePoint( 60.714561 , 234.116302 , 12.746693 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10048);]] )
   Camera:MotionSpline_AddSplinePoint( 60.714561 , 234.116302 , 12.746693 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10366);]] )
   Camera:MotionSpline_AddSplinePoint( 60.714561 , 234.116302 , 12.746693 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10366);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
