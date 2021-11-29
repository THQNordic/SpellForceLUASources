-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 333.057465 , 387.093750 , 15.148959 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9250);]] )
   Camera:MotionSpline_AddSplinePoint( 330.099670 , 387.595367 , 15.148959 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 327.141876 , 388.096985 , 15.148959 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 320.240356 , 389.267426 , 15.148959 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
