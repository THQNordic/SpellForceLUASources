-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 381.538422 , 57.899265 , 90.000000 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(378.500,61.051,89.200);]] )
   Camera:MotionSpline_AddSplinePoint( 381.538422 , 57.899265 , 90.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.538422 , 57.899265 , 90.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.538422 , 57.899265 , 90.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
