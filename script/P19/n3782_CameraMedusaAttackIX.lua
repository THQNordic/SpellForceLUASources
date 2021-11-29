-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 354.105835 , 315.898132 , 52.269844 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(4365);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,2.8);]] )
   Camera:MotionSpline_AddSplinePoint( 354.105835 , 315.898132 , 52.269844 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 354.105835 , 315.898132 , 52.269844 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 354.105835 , 315.898132 , 52.269844 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
