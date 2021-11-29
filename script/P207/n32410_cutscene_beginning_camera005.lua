-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 298.000000 , 434.000000 , 62.000000 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11868);]] )
   Camera:MotionSpline_AddSplinePoint( 298.000000 , 434.000000 , 62.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 298.000000 , 434.000000 , 62.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 298.000000 , 434.000000 , 62.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
