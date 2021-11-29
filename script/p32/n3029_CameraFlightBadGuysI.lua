-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 436.343079 , 442.920868 , 45.349842 , 29.900078 , [[Camera:ScriptSplineLookAtNpc(4202);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,4);]] )
   Camera:MotionSpline_AddSplinePoint( 448.564545 , 434.807495 , 46.449841 , 15.900024 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 472.179718 , 433.223145 , 55.988312 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 490.806183 , 461.610748 , 67.347969 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
