-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 228.014893 , 279.945587 , 23.016466 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8683);]] )
   Camera:MotionSpline_AddSplinePoint( 228.947449 , 280.306641 , 23.016466 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 229.880005 , 280.667694 , 23.016466 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 230.812561 , 281.028748 , 23.016466 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
