-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 581.517395 , 380.141357 , 62.894871 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3032);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 585.432556 , 380.831207 , 64.754868 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3032);]] )
   Camera:MotionSpline_AddSplinePoint( 586.739929 , 383.019958 , 64.916901 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 587.699524 , 386.201996 , 65.146896 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
