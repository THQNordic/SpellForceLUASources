-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 61.714561 , 235.116302 , 16.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10366);]] )
   Camera:MotionSpline_AddSplinePoint( 61.714561 , 235.116302 , 16.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10366);]] )
   Camera:MotionSpline_AddSplinePoint( 61.714561 , 235.116302 , 16.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10366);]] )
   Camera:MotionSpline_AddSplinePoint( 61.714561 , 235.116302 , 16.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(10366);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
