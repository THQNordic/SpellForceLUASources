-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 332.322113 , 383.161865 , 15.148959 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 329.364319 , 383.663483 , 15.148959 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.406525 , 384.165100 , 15.148959 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 319.505005 , 385.335541 , 15.148959 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
