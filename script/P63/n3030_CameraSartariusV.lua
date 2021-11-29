-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 587.999939 , 389.868805 , 59.855782 , 19.800039 , [[Camera:ScriptSplineLookAtNpc(3030);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 588.728394 , 393.519440 , 59.895782 , 16.400026 , [[Camera:ScriptSplineLookAtNpc(3030);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 588.728394 , 393.519440 , 59.895782 , 19.700039 , [[Camera:ScriptSplineLookAtNpc(3030);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 588.728394 , 393.519440 , 59.895782 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3030);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
