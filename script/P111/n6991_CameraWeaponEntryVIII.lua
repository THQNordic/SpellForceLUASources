-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 424.109009 , 69.179764 , 19.515680 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(7131);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,5);]] )
   Camera:MotionSpline_AddSplinePoint( 414.398132 , 68.991264 , 19.553011 , 9.299999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 407.012970 , 69.016190 , 21.045681 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 400.113678 , 68.480309 , 23.545574 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
