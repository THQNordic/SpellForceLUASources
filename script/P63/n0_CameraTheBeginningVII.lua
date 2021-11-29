-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 91.344299 , 368.371307 , 31.015221 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3107);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 91.344017 , 368.371368 , 31.015221 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 91.344017 , 368.371368 , 31.015221 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 91.344017 , 368.371368 , 31.015221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
