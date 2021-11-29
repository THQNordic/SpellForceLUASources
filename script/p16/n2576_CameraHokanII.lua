-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 558.653015 , 573.988037 , 57.459114 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(0);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);   ]] )
   Camera:MotionSpline_AddSplinePoint( 555.017273 , 573.988037 , 58.789116 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 551.272766 , 573.988037 , 60.418358 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 547.529846 , 573.988037 , 61.729111 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
