-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 56.020317 , 84.742355 , 26.043053 , 7.899995 , [[Camera:ScriptSplineLookAtNpc(5536);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.5);]] )
   Camera:MotionSpline_AddSplinePoint( 56.020317 , 84.742355 , 26.043053 , 5.199997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 56.020317 , 84.742355 , 26.043053 , 7.799995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 56.020317 , 84.742355 , 26.043053 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
