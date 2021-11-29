-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 91.828300 , 323.773834 , 33.403782 , 29.800077 , [[Camera:ScriptSplineLookAtNpc(3736);
Camera:ScriptSplineAddTargetLookAtOffset(1,-1,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 94.284119 , 322.795868 , 31.746689 , 19.100037 , [[Camera:ScriptSplineLookAtNpc(3736);
]] )
   Camera:MotionSpline_AddSplinePoint( 96.041878 , 321.979156 , 31.786655 , 29.700077 , [[Camera:ScriptSplineLookAtNpc(3736);
]] )
   Camera:MotionSpline_AddSplinePoint( 98.744408 , 322.768768 , 31.826679 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3736);
]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
