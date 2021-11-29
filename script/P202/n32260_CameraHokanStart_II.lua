-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 339.437073 , 479.477203 , 37.027081 , 19.900040 , [[Camera:ScriptSplineLookAtPosition(465.407,424.230,53.000);]] )
   Camera:MotionSpline_AddSplinePoint( 380.135071 , 478.713531 , 43.446190 , 9.299999 , [[Camera:ScriptSplineLookAtPosition(465.407,424.230,53.000);
]] )
   Camera:MotionSpline_AddSplinePoint( 418.033142 , 468.986298 , 50.117481 , 11.500008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 444.716339 , 444.623810 , 58.396782 , 15.900024 , [[Camera:ScriptSplineLookAtNpc(9038);
Camera:ScriptSplineLookAtApproachingModifier(0.04);]] )
   Camera:MotionSpline_AddSplinePoint( 475.715515 , 413.511383 , 60.630020 , 19.800039 , [[Camera:ScriptSplineLookAtNpc(9038);]] )
   Camera:MotionSpline_AddSplinePoint( 493.351746 , 395.296143 , 49.956161 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 16.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
