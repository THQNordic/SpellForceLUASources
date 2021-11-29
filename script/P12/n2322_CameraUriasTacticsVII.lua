-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 333.069275 , 390.024689 , 45.658672 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(2322);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 335.337646 , 391.937439 , 42.658672 , 10.100002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 337.099731 , 396.002716 , 41.658672 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 336.186127 , 398.921265 , 39.158672 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
