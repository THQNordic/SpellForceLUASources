-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 189.057037 , 214.571945 , 17.533230 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(11007);]] )
   Camera:MotionSpline_AddSplinePoint( 189.057037 , 214.571945 , 17.533230 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 189.057037 , 214.571945 , 17.533230 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 189.057037 , 214.571945 , 17.533230 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
