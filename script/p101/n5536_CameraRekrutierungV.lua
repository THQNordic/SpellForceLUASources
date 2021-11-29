-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 417.092010 , 176.329926 , 17.897171 , 14.200018 , [[Camera:ScriptSplineLookAtNpc(7011);]] )
   Camera:MotionSpline_AddSplinePoint( 417.092010 , 176.329926 , 17.897173 , 9.400000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 417.092010 , 176.329926 , 17.897173 , 14.100018 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 417.092010 , 176.329926 , 17.897173 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
