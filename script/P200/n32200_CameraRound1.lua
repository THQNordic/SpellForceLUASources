-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 159.047485 , 129.871048 , 14.533230 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(159.047,151.850,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 159.047485 , 129.871048 , 14.533230 , 6.099997 , [[Camera:ScriptSplineLookAtPosition(159.047,151.850,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 159.047485 , 129.871048 , 14.533230 , 9.199999 , [[Camera:ScriptSplineLookAtPosition(159.047,151.850,12.000);]] )
   Camera:MotionSpline_AddSplinePoint( 159.047485 , 129.871048 , 14.533230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(159.047,151.850,12.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
