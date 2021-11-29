-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 113.449341 , 155.877502 , 14.825220 , 8.799997 , [[Camera:ScriptSplineLookAtPosition(110.000,154.000,14);]] )
   Camera:MotionSpline_AddSplinePoint( 113.449341 , 155.877502 , 14.825220 , 5.799997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 113.449341 , 155.877502 , 14.825220 , 8.699997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 113.449165 , 155.877502 , 14.825220 , 19.900040 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
