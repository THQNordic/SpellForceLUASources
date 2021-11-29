-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 183.271896 , 353.106689 , 33.716690 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(2994);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 178.991531 , 352.246613 , 34.056389 , 9.600000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 175.039032 , 348.000885 , 34.856571 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 172.299774 , 341.599365 , 35.456692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
