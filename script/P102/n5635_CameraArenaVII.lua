-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 255.276154 , 529.883789 , 9.152898 , 19.200037 , [[Camera:ScriptSplineLookAtNpc(5635);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 255.276154 , 529.883789 , 9.152898 , 12.700012 , [[Camera:ScriptSplineLookAtNpc(5635);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 255.276154 , 529.883789 , 9.152898 , 19.100037 , [[Camera:ScriptSplineLookAtNpc(5635);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 255.276154 , 529.883789 , 9.152898 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5635);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
