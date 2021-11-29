-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 320.025024 , 407.838531 , 38.605911 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(5938);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 320.230927 , 410.062347 , 36.605911 , 5.399997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 320.437103 , 412.278503 , 36.605911 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 320.303680 , 415.825897 , 36.485958 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
