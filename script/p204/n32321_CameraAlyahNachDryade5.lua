-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 230.616837 , 271.455963 , 16.841490 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9877);]] )
   Camera:MotionSpline_AddSplinePoint( 230.616837 , 271.455963 , 18.841490 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 230.616837 , 271.455963 , 20.841490 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 230.616837 , 271.455963 , 22.841490 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
