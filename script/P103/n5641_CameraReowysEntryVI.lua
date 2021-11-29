-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 120.564140 , 254.448608 , 31.052917 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6757);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 120.564140 , 254.448608 , 31.052917 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 120.564140 , 254.448608 , 31.052917 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 120.564140 , 254.448608 , 31.052917 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.664063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
