-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 166.156631 , 137.216095 , 14.108975 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(163.000,131.500,11);]] )
   Camera:MotionSpline_AddSplinePoint( 166.156631 , 137.216095 , 14.108975 , 6.099997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 166.156631 , 137.216095 , 14.108975 , 9.199999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 166.156631 , 137.216095 , 14.108975 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
