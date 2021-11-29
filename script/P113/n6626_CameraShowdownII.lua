-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 205.237793 , 315.536346 , 23.866692 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(7211);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.0);]] )
   Camera:MotionSpline_AddSplinePoint( 205.237823 , 315.536377 , 23.866692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 205.237823 , 315.536377 , 23.866692 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 205.237823 , 315.536377 , 23.866692 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
