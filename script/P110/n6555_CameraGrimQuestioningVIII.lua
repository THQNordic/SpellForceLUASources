-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 610.148804 , 399.349548 , 28.331018 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(6738);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 610.890137 , 399.922546 , 28.331018 , 5.999997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 611.629761 , 400.494263 , 28.331018 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 615.907288 , 403.800507 , 28.331018 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
