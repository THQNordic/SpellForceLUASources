-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 360.545990 , 166.707581 , 33.757835 , 9.800001 , [[Camera:ScriptSplineLookAtNpc(7011);
Camera:ScriptSplineAddTargetLookAtOffset(1,-0.5,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 360.545990 , 166.707581 , 32.757835 , 6.499996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 360.545990 , 166.707581 , 31.757835 , 9.700001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 360.545990 , 166.707581 , 30.757835 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
