-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 120.308418 , 212.489075 , 26.668739 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11015);]] )
   Camera:MotionSpline_AddSplinePoint( 120.308418 , 212.489075 , 26.668739 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 120.308418 , 212.489075 , 26.668739 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 120.308418 , 212.489075 , 26.668739 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
