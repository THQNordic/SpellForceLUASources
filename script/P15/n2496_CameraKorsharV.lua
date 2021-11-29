-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 94.475914 , 339.589142 , 13.286873 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(3449);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 95.771957 , 342.890991 , 13.246876 , 6.699996 , [[Camera:ScriptSplineLookAtPosition(83.414,343.199,28.757);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 95.953659 , 344.817474 , 13.246872 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 95.026596 , 345.848114 , 13.206871 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
