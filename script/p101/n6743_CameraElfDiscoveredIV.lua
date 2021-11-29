-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 322.024506 , 568.602661 , 17.375996 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(7010);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 322.024506 , 568.602661 , 17.375996 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 322.024506 , 568.602661 , 17.375996 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 322.024506 , 568.602661 , 17.375996 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 60.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
