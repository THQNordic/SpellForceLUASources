-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 364.468628 , 172.679611 , 33.137833 , 14.900021 , [[Camera:ScriptSplineLookAtNpc(6116);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,3.5);]] )
   Camera:MotionSpline_AddSplinePoint( 360.244812 , 171.552322 , 32.137833 , 11.700008 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 359.708954 , 167.269165 , 32.137836 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 361.841705 , 166.738724 , 31.137836 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
